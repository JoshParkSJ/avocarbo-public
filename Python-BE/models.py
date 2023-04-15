from pydantic import BaseModel

class ICalculateCarbs(BaseModel):
    file: str

class IResultCarbs(BaseModel):
    food_name: str
    carbs_count: float

class ILoginForm(BaseModel):
    email: str
    password: str

class IRegisterForm(BaseModel):
    email: str
    password: str

class IToken(BaseModel):
    authToken: str 

class IMeal(BaseModel):
    food_name: str
    carbs_count: str
    image: str
    portion: str