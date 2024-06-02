import 'package:flutter/material.dart';
import 'package:navigation_assignment/core/services/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
         routerConfig: router,
    
      //  AuthorsScreen(),
    );
    // return MaterialApp(
    //   home: Login(),
    // );
    
  }
}
