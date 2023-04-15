import io
import jwt
import uuid
import boto3
import base64
import certifi # By default, pymongo relies on the operating system’s root certificates
import requests
from PIL import Image
from datetime import datetime
from passlib.hash import argon2
from pymongo import MongoClient
from fastapi import FastAPI, File, UploadFile, Request, HTTPException, status

from prediction import read_image, predict
from models import IRegisterForm, ILoginForm, IMeal, ICalculateCarbs, IResultCarbs, IToken

SECRET = "SECRET"
CRYPT_ALGO = "HS256"
AWS_BUCKET = "AWS_BUCKET"
AWS_ACCESS_KEY = "AWS_ACCESS_KEY" # root user access key
AWS_SECRET_KEY = "AWS_SECRET_KEY" # root user secret key

# python3 -m uvicorn main:app
app = FastAPI()
avocarbo_db = MongoClient('connetion_string', tlsCAFile=certifi.where())["avocarbo"]
s3_bucket = boto3.client('s3', aws_access_key_id=AWS_ACCESS_KEY, aws_secret_access_key=AWS_SECRET_KEY)
s3_location = s3_bucket.get_bucket_location(Bucket=AWS_BUCKET)['LocationConstraint']

# --------------------------------------------------------------------------------
# Introspection
# --------------------------------------------------------------------------------
@app.middleware("http")
async def validate_access_token(request: Request, call_next):
    response = await call_next(request)
    path = request.scope["path"]

    if path in ["/login", "/register", "/docs", "/openapi.json"]:
        return response

    if "Authorization" in request.headers:
        access_token = request.headers["Authorization"].split()
        is_valid_signature = jwt.decode(access_token[1], key=SECRET, algorithms=CRYPT_ALGO)

        if is_valid_signature:
            return response

    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED, 
        detail='Invalid access token'
    )


# --------------------------------------------------------------------------------
# Authentication & Authorization 
# --------------------------------------------------------------------------------
@app.post("/login", status_code=status.HTTP_200_OK)
async def login(login_form: ILoginForm) -> IToken:
    user = avocarbo_db.Users.find_one({ "email": login_form.email })
    isValid = argon2.verify(login_form.password, user["hashed_password"])
    
    if isValid:
        signaturePayload = { "email": login_form.email }
        authToken = jwt.encode(signaturePayload, SECRET, algorithm=CRYPT_ALGO)
        return { "authToken": authToken }
    else:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED, 
            detail='User already exists'
        )

@app.post("/register", status_code=status.HTTP_201_CREATED)
async def register(register_form: IRegisterForm) -> IToken:
    userExists = avocarbo_db.Users.find_one({ "email": register_form.email })

    if not userExists:
        avocarbo_db.Users.insert_one({
            "userId": str(uuid.uuid4()),
            "email": register_form.email,
            "hashed_password": argon2.hash(register_form.password) # built in salting
        })
        signaturePayload = { "email": register_form.email }
        authToken = jwt.encode(signaturePayload, SECRET, algorithm=CRYPT_ALGO)
        return { "authToken": authToken }
    else:
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT, 
            detail='User already exists'
        )


# --------------------------------------------------------------------------------
# Counting Carbs
# --------------------------------------------------------------------------------

# endpoint to test prediction model
@app.post("/predict/image")
async def predict_api(file: UploadFile = File(...)):
    extension = file.filename.split(".")[-1] in ("jpg", "jpeg", "png")
    if not extension:
        return "Image must be JPG or PNG format."

    # classify food
    image = read_image(await file.read())
    prediction = predict(image)

    return prediction

@app.post("/calculate_carbs")
async def calculate_carbs(food_info: ICalculateCarbs) -> IResultCarbs:
    # base64 decrypt
    file_in_bytes = base64.b64decode(food_info.file)
    
    # classify food
    image = Image.open(io.BytesIO(file_in_bytes))
    predictions = predict(image)

    # calculate carbs
    result = []
    for prediction in predictions: 
        resultObj = { 
            "id": prediction["class"], 
            "type": prediction["class"], 
            "confidence": prediction["confidence"] 
        }

        food_name = prediction["class"]
        query = "1 portion of " + food_name
        carbs_count = float(await get_carbs_count(query))

        resultObj["carbCount"] = str(carbs_count)
        resultObj["volume"] = "10"
        result.append(resultObj)
    
    return { "foods": result }

@app.post("/save_meal")
async def save_meal(request: Request, meal: IMeal):

    avocarbo_db.Meals.insert_one({
        "id": str(uuid.uuid4()),
        "food": meal.food_name,
        "carbAmount": str(meal.carbs_count),
        "image": meal.image
    })
    
    # upload food image to bucket
    key_name = str(uuid.uuid4())
    s3_bucket.put_object(Key=key_name, Body=file_in_bytes, Bucket=AWS_BUCKET)
    access_token = request.headers["Authorization"].split()
    decoded_payload = jwt.decode(access_token[1], key=SECRET, algorithms=CRYPT_ALGO)
    avocarbo_db.Meals.insert_one({
        "email": decoded_payload["email"],
        "mealId": key_name,
        "portion": meal.portion,
        "carbAmount": meal.carbs_count,
        "date": datetime.now(),
        "food": meal.food_name
    })
    
    return None


@app.get("/history")
async def get_history():
    return { "history": list(avocarbo_db.Meals.find({}, {'_id': 0})) }

# clearing data to reduce lag during demo
@app.delete("/all_but_one")
async def get_history():
    avocarbo_db.Meals.delete_many({ "id": { "$ne": "ab0ee3fc-11e6-485f-8880-3d26dd56c6ac" }})
    return True

# --------------------------------------------------------------------------------
# NutritionDB controller
# --------------------------------------------------------------------------------
# api: https://www.nutritionix.com/business/api
# documentation: https://docs.google.com/document/d/1_q-K-ObMTZvO0qUEAxROrN3bwMujwAN25sLHwJzliK0/edit# 
# uses NLP -> example input query: "300g of chicken breast"
@app.post("/nutrition")
async def get_carbs_count(text: str):
    url = "https://trackapi.nutritionix.com/v2/natural/nutrients"
    data = { "query": text }
    headers = {
        "x-app-id": "app-id",
        "x-app-key": "x-app-key",
        "x-remote-user-id": "0"
    }
    response = requests.post(url, headers=headers, data=data).json()
    carbs_count = response["foods"][0]["nf_total_carbohydrate"]
    return carbs_count



# TOP 1 PREDICTION (archive)
# @app.post("/calculate_carbs")
# async def calculate_carbs(request: Request, food_info: ICalculateCarbs) -> IResultCarbs:
#     # base64 decrypt
#     file_in_bytes = base64.b64decode(food_info.file)
    
#     # classify food
#     image = Image.open(io.BytesIO(file_in_bytes))
#     prediction = predict(image)

#     # base64 decrypt
#     file_in_bytes = base64.b64decode(food_info.file)
    
#     # classify food
#     image = Image.open(io.BytesIO(file_in_bytes))
#     prediction = predict(image)

#     # calculate carbs
#     food_name = prediction[0]["class"] # get highest confidence class
#     portion = food_info.portion
#     query = str(portion) + "g of " + "coffee" # HARD CODED "COFFEE" FOR NOW, REMOVE LATER
#     carbs_count = float(await get_carbs_count(query))

#     # upload food image to bucket
#     key_name = str(uuid.uuid4())
#     s3_bucket.put_object(Key=key_name, Body=file_in_bytes, Bucket=AWS_BUCKET)
#     access_token = request.headers["Authorization"].split()
#     decoded_payload = jwt.decode(access_token[1], key=SECRET, algorithms=CRYPT_ALGO)
#     avocarbo_db.Meals.insert_one({
#         "email": decoded_payload["email"],
#         "mealId": key_name,
#         "portion": food_info.portion,
#         "carbAmount": carbs_count,
#         "date": datetime.now(),
#         "food": food_name
#     })

#     return {
#         "food_name": food_name,
#         "carbs_count": carbs_count
#     }
