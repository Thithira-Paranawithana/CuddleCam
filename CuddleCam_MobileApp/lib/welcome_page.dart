import 'dart:ffi';
import 'package:cuddleslider/widgets/app_large_text.dart';
import 'package:cuddleslider/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cuddleslider/widgets/app_text.dart';
import 'package:flutter/src/widgets/container.dart';


class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

// Creating WelcomeScreen with sliders
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    // Images list for the WelcomeScreen
    List images = [
      "img11.png",
      "img13.webp",
      "bgimg.jpg",
    ];

    // Titles list for the WelcomeScreen
    List title = [
      "CuddleCam",
      "Real-Time",
      "Live Video",
    ];

    // Sub-titles list for the WelcomeScreen
    List subtitle = [
      "BABY CARE",
      "NOTIFICATIONS",
      "& VIDEO RECORDINGS",
    ];

    List essay = [
      "Portable Baby Monitoring System which Protects Your Baby",
      "We'll Notify You Immediately Whenever Your Baby is at Risk",
      "Baby is Always Near You with Our Live Streaming Feature",
    ];

    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/"+images[index]     // Adding images to the WelcomeScreen
                ),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: title[index]),     // Adding titles with styles
                      AppText(text: subtitle[index], size: 30,),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppText(
                          // color: Colors.black45,
                          text: essay[index],
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40,),
                      ResponsiveButton(),     // Button to enter HomeScreen
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:index==indexDots? Colors.brown[600]:Colors.brown[600]?.withOpacity(0.3),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
         
      }),
    );
  }
}
