import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';


class AuthorDetail extends StatelessWidget {
  const AuthorDetail({super.key, required this.index});
  // final List <String> author;
  final int index;
    String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    
    return text[0].toUpperCase() + text.substring(1);
  }
  @override
  Widget build(BuildContext context) {
        // final capitalizedBookIndex = capitalizeFirstLetter(authorIndex);
      final String author= authors[index];

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whitethemeColor,
        backgroundColor: whitethemeColor,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              authors[index],
              style: TextStyle(
                  fontSize: 20, color: blackColor, fontWeight: FontWeight.w500,),
            ),
          ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      backgroundColor: whitethemeColor,
      body:  Container(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Text('$author Description',   style: TextStyle(
                  fontSize: 20, color: blackColor, fontWeight: FontWeight.w500,),),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
