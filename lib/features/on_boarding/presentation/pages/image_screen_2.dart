import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/image_screen_3.dart';

class ImageScreenTwo extends StatelessWidget {
  const ImageScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    minimumSize: const Size(78, 30),
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
                      style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 234, 232, 232),
            height: screenHeight * .75,
            child: const Center(
              child: Text(
                'Image 2',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 28, bottom: 25, left: 0, right: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)) // Add border radius
                        ),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                    backgroundColor: blueThemeColor,
                    textStyle: const TextStyle(
                        color: Color.fromARGB(238, 255, 255, 255),
                        fontSize: 24,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Back',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 28, bottom: 25, left: 0, right: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)) // Add border radius
                        ),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                    backgroundColor: blueThemeColor,
                    textStyle: const TextStyle(
                        color: Color.fromARGB(238, 255, 255, 255),
                        fontSize: 24,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageScreenThree()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
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
