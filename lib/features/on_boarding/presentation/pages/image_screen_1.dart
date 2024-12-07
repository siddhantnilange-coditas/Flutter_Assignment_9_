import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/image_screen_2.dart';

class ImageScreenOne extends StatelessWidget {
  const ImageScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 27, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)) 
                        ),
                    minimumSize: Size(78, 28),
                    backgroundColor: blueThemeColor,
                    textStyle: const TextStyle(
                        color: Color.fromARGB(238, 255, 255, 255),
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    context.go('/login');
                  },
                  child: const Text('Skip',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 234, 232, 232),
            height: screenHeight * .75,
            child: Center(
              child: Text(
                'Image 1',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 28, bottom: 25, left: 135, right: 135),
                child: ElevatedButton(
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(12)) // Add border radius
                        ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                    backgroundColor: blueThemeColor,
                    textStyle: const TextStyle(
                        color: Color.fromARGB(238, 255, 255, 255),
                        fontSize: 24,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageScreenTwo()),
                    );
                  },
                ),
              ),
            ],
          ),

          // Center(
          //   child: SvgPicture.asset(
          //     'assets/icons/coditas_logo.svg',
          //   ),
          // ),
        ],
      ),
    );
  }
}
