import 'package:cuddleslider/widgets/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatefulWidget {
  bool isResponsive;
  double? width;
  bool glowing=true;
  ResponsiveButton({Key? key, this.width, this.isResponsive=false}) : super(key: key);

  @override
  State<ResponsiveButton> createState() => _ResponsiveButtonState();
}

class _ResponsiveButtonState extends State<ResponsiveButton> {
  get glowing => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 80,
        height: 40,// Adjust the button's width and height
        decoration: BoxDecoration(
          color: Colors.cyan[800], // Set the button background color
          borderRadius: BorderRadius.circular(10), // Make it smooth
        ),
        child: ElevatedButton(
          onPressed: () {
            // When the button is pressed, navigate to the HomeScreen.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),

              ),
            );
            print('Hello USER');    //Print to test
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent, // Transparent background for ElevatedButton
            elevation: 0, // No shadow
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10), // Add some spacing
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24, // Adjust the icon size as needed
              ),
            ],
          ),
        ),
      ),

    );
  }
}

