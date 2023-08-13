# Avocarbo

<div align="center">
	<h2>Carbohydrate counting app for type 1 diabetes patients</h2>
	<a href="https://www.youtube.com/shorts/Q4NB3msjlTQ" target="_blank"><img src="https://img.youtube.com/vi/Q4NB3msjlTQ/0.jpg" /></a>
	<p>DEMO: https://www.youtube.com/shorts/Q4NB3msjlTQ</p>
</div>

### Problem
1. Weighing food and referring to a list of carb count is accurate but slow

2. Diet-tracking apps are untailored for T1D as it's full of unnecessary information

3. Features that estimate carbs with a picture is hidden behind a paywall

### Solution
With our mobile app, T1D patients can simply take a picture and quickly obtain a carbs count. Our app features portion estimation (depth map) and food classification algorithms (ResNet50, convolutional neural network) that can calculate carbs count within seconds, and a simple UI that allows you to log your food with <10 interactions

For our machine learning modeL, we want our image size of 150 x 150 x 3 (150 pixels of width and length, and x3 for red green blue), to get its feature extracted by the ResNet architecture. We ensure that the original weights do not change so that we can utilize ResNet’s highly optimized feature extractor. We simply add 2 extra convolutional layers and 1 output layer at the end of the model’s architecture to tailor the model towards classifying food classes. After manually going through the imagenet database, we discovered that 59 out of the 1000 classes are food classes. Hence, we created our own custom dataset by combining the imagenet database with just the 59 food classes and the 101 food classes from the food-101 database. As a result, our model uses ResNet’s highly optimized feature extractor to extract generic visual features like shapes and lines to classify 160 food classes. 

<div align="center">
	<img src="https://github.com/JoshParkSJ/avocarbo-public/blob/main/Python-BE/process_flow.png?raw=true"/>
</div>


### Contributions
Enrique Moran: iOS

Ansel Chen: Android, iOS

Joshua Park: Backend, Machine Learning, Android

### Misc.

Machine Learning Script: https://www.kaggle.com/code/joshparksj/avocarbo

Incomplete Android version: https://youtu.be/M7OvEp80Xw0
