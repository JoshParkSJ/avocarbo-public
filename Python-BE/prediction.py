import ssl
import numpy as np
import tensorflow as tf
from PIL import Image 
from io import BytesIO
from tensorflow.keras.applications.imagenet_utils import decode_predictions
from tensorflow.keras.optimizers import Adam
import labels

model = None

# why do we need ssl._create_default_https_context?
# error: Exception: URL fetch failure on https://storage.googleapis.com/tensorflow/keras-applications/mobilenet_v2/mobilenet_v2_weights_tf_dim_ordering_tf_kernels_1.0_224.h5: None -- [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1091)
# solution: https://stackoverflow.com/a/53516832/13738079
ssl._create_default_https_context = ssl._create_unverified_context 

def read_image(image_encoded) -> Image.Image:
    pil_image = Image.open(BytesIO(image_encoded))
    return pil_image

def load_model():
    # without transfer learning
    # model = tf.keras.applications.ResNet50V2(weights="imagenet")

    # with transfer learning
    model = tf.keras.models.load_model('./resnet_model.h5', compile=False)
    model.compile(
        optimizer=Adam(learning_rate=0.001),
        loss="categorical_crossentropy",
        metrics=["accuracy", "top_k_categorical_accuracy"]
    )

    return model


def predict(image: np.ndarray):
    global model
    if model is None:
        model = load_model()

    image = np.asarray(image.resize((224, 224)))[..., :3]
    image = np.expand_dims(image, 0)
    image = image / 127.5 - 1.0
    
    response = []

    # without transfer learning
    # result = decode_predictions(model.predict(image), 5)[0]
    # for res in result:
    #     predicted_label = res[1].lower()
    #     if predicted_label in labels.imagenet_foods:
    #         response.append({
    #             "class": predicted_label,
    #             "confidence": f"{res[2]*100:0.2f} %",
    #         })

    # with transfer learning 
    predictions = model.predict(image)
    result = np.argsort(predictions, axis=1)[:,-5:][0]
    for idx in result:
        response.append({
            "class": labels.food101[idx],
            "confidence": str(round(predictions[0][idx] * 100, 2)) + "%"
        })

    return response