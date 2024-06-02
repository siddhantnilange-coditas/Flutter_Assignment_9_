import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whitethemeColor,
        backgroundColor: whitethemeColor,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Register',
              style: TextStyle(
                  fontSize: 20, color: blackColor, fontWeight: FontWeight.w500,),
            ),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      backgroundColor: whitethemeColor,
      body: 
         Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              SizedBox(
                height: 194,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Given Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.w700,),
                  ),
                  ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      // labelText: "Enter Username",

                      hintStyle: TextStyle(fontSize: 20),
                      hintText: "Enter Given Name",
                      fillColor: const Color.fromARGB(255, 18, 18, 18),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(4.0),
                        borderSide: new BorderSide(),
                      ),
                    ),),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Family Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.w700),
                  ),
                  ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      // labelText: "Enter Username",

                      hintStyle: TextStyle(fontSize: 20),
                      hintText: "Enter Family Name",
                      fillColor: const Color.fromARGB(255, 18, 18, 18),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(4.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username',
                    style: TextStyle(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.w700,),
                  ),),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      // labelText: "Enter Username",

                      hintStyle: TextStyle(fontSize: 20),
                      hintText: "Enter Username",
                      fillColor: const Color.fromARGB(255, 18, 18, 18),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(4.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.w700,),
                  ),
                  ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      // labelText: "Enter Username",

                      hintStyle: TextStyle(fontSize: 20),
                      hintText: "Enter Password",
                      fillColor: const Color.fromARGB(255, 18, 18, 18),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(4.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
              ),
              Expanded(
                child: SizedBox(
                  height: 23,
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Sign',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10),) ,// Add border radius
                      ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 48),
                  backgroundColor: blueThemeColor,
                  textStyle: const TextStyle(
                      color: Color.fromARGB(238, 255, 255, 255),
                      fontSize: 24,
                      fontStyle: FontStyle.normal,),
                ),
                onPressed: () {
                  context.go('/login');
                },
              ),
              SizedBox(
                height: 139,
              ),
            ],
          ),
        ),
      
    );
  }
}
