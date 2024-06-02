import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

class StaticUsers {
  static List<User> users = [
    User(username: 'Siddhant', password: 'Sidd@12345'),
    User(username: 'Sidd', password: 'Sidd@12345'),
  ];

  // static User? getUser(String username) {
  //   return users.firstWhere((user) => user.username == username, orElse: () => null);
  // }
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool validateCredentials(String username, String password) {
    for (var user in StaticUsers.users) {
      if (user.username == username && user.password == password) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              SvgPicture.asset(
                'assets/icons/coditas_logo.svg',
                height: 96,
                width: 32,
              ),
              const Expanded(
                child: SizedBox(
                  height: 64,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 14,
                    color: blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextFormField(
                  controller: usernameController,
                  // maxLength: 15,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    // labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Enter username',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(18)),
                    //   borderSide: BorderSide(color: Colors.blue),
                    // ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const Expanded(
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
                      fontWeight: FontWeight.w700),
                ),
              ),

              const SizedBox(
                height: 4,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextFormField(
                  controller: passwordController,
                  // maxLength: 20,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    // labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Enter password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(18)),
                    //   borderSide: BorderSide(color: Colors.blue),
                    // ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 36,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ), // Add border radius
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
                  backgroundColor: blueThemeColor,
                  textStyle: const TextStyle(
                      color: Color.fromARGB(238, 255, 255, 255),
                      fontSize: 24,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    String username = usernameController.text;
                    String password = passwordController.text;
                    if (validateCredentials(username, password)) {
                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreenState.loginStatus, true);
                      context.go('/home');
                      print("********Valid Data");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid username or password')),
                      );
                    }
                  }
                },
                child: const Text(
                  'Sign',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              // Expanded(
              //   child: SizedBox(
              //     height: 16,
              //   ),
              // ),
              TextButton(
                onPressed: () {
                  // context.go('/register');
                  GoRouter.of(context)
                      .pushNamed(MyAppRouteConstants.registerRouteName);
                },
                child: Text(
                  'Don’t have an account yet? Sign up',
                  style: TextStyle(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 276,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
