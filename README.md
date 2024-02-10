# CuddleCam
<I>A portable and automated baby monitoring system which uses computer vision techniques to notify the parents through a mobile app whenever a risky situation occurs.</I>

“CuddleCam” is a portable baby monitoring system designed to provide parents with peace of mind by utilizing machine learning. The embedded system consists of a Raspberry Pi and a webcam to monitor babies. 
Using trained models, the system can detect and differentiate the baby from animals such as cats, dogs, and other individuals. The system alerts parents if the baby engages in risky behavior, such as falling or crying.
A mobile app, developed using Flutter and Dart, provides access to view the most recent 10 minutes of camera footage. The app also enables real-time video streaming through Wi-Fi. The project involves setting up the Raspberry Pi, training the computer vision models, constructing mobile app, implementing video streaming capabilities, and following a step-by-step approach to achieve the desired functionality.

<h3>Architecture of the system:</h3>

<p align="center">
    <img src="https://github.com/Thithira-Paranawithana/CuddleCam/assets/153026117/bb2f7e81-6264-4b8d-b8cd-c2f213841bdb" alt="CuddleCam architecture" width="350" height="350">
</p>


The baby is captured by using the webcam and the live video is sent to the Raspberry Pi where computer vision techniques are used to identify objects, poses and emotions of the baby. Whenever the program recognizes a risky movement or a risky situation of the baby, a notification is sent to the mobile app with clarification about the situation immediately through flask server. Both Raspberry Pi and the mobile app are connected to the same Wi-Fi network, and the Raspberry Pi is given a static IP address to be identified by the mobile in the network. 

<h3>Technologies:</h3>

For the image processing part in the Raspberry Pi, computer vision libraries are used.
•	OpenCV
•	MediaPipe
•	TensorFlow Lite
OpenCV is used to identify the external camera connected to the Raspberry Pi. After identifying the camera, it captures the video using camera and is used for image and video processing. "ssd_mobilenet_v3_large_coco" model is used for object detection using the COCO dataset. MediaPipe is mainly used for pose detection using landmarks. And TensorFlow Lite, which is the most compatible TensorFlow version for lightweighted systems like Raspberry Pi is used to train emotion detection model with the help of FER2013 facial emotion recognition dataset.

The notifications and the video footage are sent to the mobile app using Flask and HTTP protocol.
Threads are used to handle parallel programming happens in the embedded system including getting the live video, processing computer vision models, saving the video footage and communicating with the mobile phone.
Mobile app is developed using Flutter and Dart with necessary dependencies and permissions. There, http requests are used to receive notifications and most recent video footage.

<h3>Some UIs of the CuddleCam mobile application:</h3>

<p align="center">
    <img src="https://github.com/Thithira-Paranawithana/CuddleCam/assets/153026117/35c57509-7e07-433e-925b-5792fd7823c3" alt="CuddleCam App" width="250" height="450">
</p>



