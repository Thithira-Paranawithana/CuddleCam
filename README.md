# CuddleCam
A portable and automated baby monitoring system which uses computer vision techniques to notify the parents through a mobile app whenever a risky situation occurs.

“CuddleCam” is a portable baby monitoring system designed to provide parents with peace of mind by utilizing machine learning. The embedded system consists of a Raspberry Pi and a webcam to monitor babies. 
Using trained models, the system can detect and differentiate the baby from animals such as cats, dogs, and other individuals. The system alerts parents if the baby engages in risky behavior, such as falling or crying.
A mobile app, developed using Flutter and Dart, provides access to view the most recent 10 minutes of camera footage. The app also enables real-time video streaming through Wi-Fi. The project involves setting up the Raspberry Pi, training the computer vision model, constructing mobile apps, implementing video streaming capabilities, and following a step-by-step approach to achieve the desired functionality.

Architecture of the system:

![image](https://github.com/Thithira-Paranawithana/CuddleCam/assets/153026117/bb2f7e81-6264-4b8d-b8cd-c2f213841bdb)

The baby is captured by using the webcam and the live video is sent to the Raspberry Pi where computer vision techniques are used to identify objects, poses and emotions of the baby. Whenever the program recognizes a risky movement or a risky situation of the baby, a notification is sent to the mobile app with clarification about the situation immediately through flask server. Both Raspberry Pi and the mobile app are connected to the same Wi-Fi network, and the Raspberry Pi is given a static IP address to be identified by the mobile in the network. 
