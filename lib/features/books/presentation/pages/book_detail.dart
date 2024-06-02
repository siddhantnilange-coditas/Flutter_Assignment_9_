import 'package:flutter/material.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.index,
  });
    final int index;



  @override
  Widget build(BuildContext context) {
          final String book = books[index];

    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitethemeColor,
          backgroundColor: whitethemeColor,
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                 book,
                style: TextStyle(
                    fontSize: 20,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
              ),
            ),
          elevation: 1,
          shadowColor: Colors.black,
        ),
        backgroundColor: whitethemeColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                '$book Description',
                style: TextStyle(
                    fontSize: 20,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
  }
}
