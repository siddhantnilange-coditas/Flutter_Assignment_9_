import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/image_screen_2.dart';

class ImageScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, right: 27, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 234, 232, 232),
            height: screenHeight * .75,
            child: Center(
              child: Text(
                'Image 3',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 28, bottom: 25, left: 0, right: 0),
                child: ElevatedButton(
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)) // Add border radius
                        ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                    backgroundColor: blueThemeColor,
                    textStyle: const TextStyle(
                        color: Color.fromARGB(238, 255, 255, 255),
                        fontSize: 24,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {},
                ),
              ),
               Padding(
                padding:
                    EdgeInsets.only(top: 28, bottom: 25, left: 0, right: 0),
                child: ElevatedButton(
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)) // Add border radius
                        ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                    backgroundColor: blueThemeColor,
                    textStyle: const TextStyle(
                        color: Color.fromARGB(238, 255, 255, 255),
                        fontSize: 24,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                            context.go('/login');

          
                  },
                ),
              ),
            ],
          ),

          
        ],
      ),
    );
  }
}
