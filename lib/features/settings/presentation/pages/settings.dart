import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/language_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> languages = ['English', 'Hindi', 'Marathi', 'Arabic'];
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.settings,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalizations.of(context)!.userName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(thickness: 1, color: Colors.black),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 230,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      return RadioListTile<int>(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          
                          languages[index], 
                          ),
                        value: index,
                        groupValue: state.selectedIndex,
                        onChanged: (int? value) {
                              FirebaseAnalytics.instance.logEvent(
                      name: 'language_changed',
                      parameters: <String, dynamic>{
                        'new_language' : languages[value!],
                      }
                    );
                          if (value != null) {
                            context.read<LanguageBloc>().add(SelectedLanguageEvent(value));
                          }
                        },
                      );
                    },
                  ),
                ),
                Divider(thickness: 1, color: Colors.black),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () async {
                        FirebaseAnalytics.instance.logEvent(
                      name: 'logout',
                      parameters: <String, dynamic>{
                        'logout' : 'logouted_from_app',
                      }
                    );
                      final sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreenState.loginStatus, false);
                      context.go('/login');
                      throw Exception();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.logout,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// imp
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/language_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Settings extends StatelessWidget {
//   const Settings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<String> languages = ['English', 'Hindi', 'Marathi', 'Arabic'];

//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: whitethemeColor,
//         backgroundColor: whitethemeColor,
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Settings',
//             style: TextStyle(
//               fontSize: 20,
//               color: blackColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         elevation: 1,
//         shadowColor: Colors.black,
//       ),
//       backgroundColor: whitethemeColor,
//       body: BlocProvider(
//         create: (context) => LanguageBloc(),
//         child: BlocBuilder<LanguageBloc, LanguageState>(
//           builder: (context, state) {
//             return Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       'Sidd',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: blackColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Divider(thickness: 1, color: blackColor),
//                   const SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       'Language',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: blackColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30),
//                     height: 230,
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       itemCount: languages.length,
//                       itemBuilder: (context, index) {
//                         return RadioListTile<int>(
//                           contentPadding: EdgeInsets.zero,
//                           title: Text(languages[index]),
//                           value: index,
//                           groupValue: state.selectedIndex,
//                           onChanged: (int? value) {
//                             if (value != null) {
//                               context
//                                   .read<LanguageBloc>()
//                                   .add(SelectedLanguageEvent(value));
//                             }
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   Divider(thickness: 1, color: blackColor),
//                   SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: InkWell(
//                       onTap: () async {
//                         final sharedPref =
//                             await SharedPreferences.getInstance();
//                         sharedPref.setBool(
//                             SplashScreenState.loginStatus, false);
//                         context.go('/login');
//                       },
//                       child: Text(
//                         'Log Out',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: blackColor,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/language_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Settings extends StatelessWidget {
//   const Settings({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List<String> languages = ['English', 'Hindi', 'Marathi', 'Arabic'];

//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: whitethemeColor,
//         backgroundColor: whitethemeColor,
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Settings',
//             style: TextStyle(
//               fontSize: 20,
//               color: blackColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         elevation: 1,
//         shadowColor: Colors.black,
//       ),
//       backgroundColor: whitethemeColor,
//       body: BlocProvider(
//         create: (context) => LanguageBloc(),
//         child: BlocBuilder<LanguageBloc, LanguageState>(
//           builder: (context, state) {
//             return Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       'Sidd',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: blackColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Divider(thickness: 1, color: blackColor),
//                   const SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       'Language',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: blackColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30),
//                     height: 230,
//                     child: BlocBuilder<LanguageBloc, LanguageState>(
//                       builder: (context, state) {
//                         if (state is SelectedLanguageEvent) {
//                           return ListView.builder(
//                             padding: EdgeInsets.zero,
//                             itemCount: languages.length,
//                             itemBuilder: (context, index) {
//                               return RadioListTile<int>(
//                                 contentPadding: EdgeInsets.zero,
//                                 title: Text('${languages[index]}'),
//                                 value: index,
//                                 groupValue: state.selectedLanguage,
//                                 onChanged: (int? value) {
//                                   if (value != null) {
//                                     context
//                                         .read<LanguageBloc>()
//                                         .add(SelectedLanguageEvent(value));
//                                   }
//                                 },
//                               );
//                             },
//                           );
//                         } else {
//                           return Center(child: CircularProgressIndicator());
//                         }
//                       },
//                     ),
//                   ),
//                   Divider(thickness: 1, color: blackColor),
//                   SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: InkWell(
//                       onTap: () async {
//                         final sharedPref = await SharedPreferences.getInstance();
//                         sharedPref.setBool(SplashScreenState.loginStatus, false);
//                         context.go('/login');
//                       },
//                       child: Text(
//                         'Log Out',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: blackColor,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/language_bloc.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/settings_bloc.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/settings_events.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Settings extends StatelessWidget {
//   const Settings({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     List<String> languages = ['English', 'Hindi', 'Marathi', 'Arabic'];

//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: whitethemeColor,
//         backgroundColor: whitethemeColor,
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Settings',
//             style: TextStyle(
//               fontSize: 20,
//               color: blackColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         elevation: 1,
//         shadowColor: Colors.black,
//       ),
//       backgroundColor: whitethemeColor,
//       body: BlocProvider(
//         create: (context) => LanguageBloc(),
//         child: Container(
//           // padding: EdgeInsets.symmetric(horizontal: 26),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   'Sidd',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: blackColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Divider(
//                 thickness: 1,
//                 color: blackColor,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   'Language',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: blackColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 height: 230,
//                 child: BlocBuilder<LanguageBloc, LanguageState>(
//                   // bloc: LanguageBloc(),
//                   builder: (context, state) {
//                     return state is LanguageInitial
//                         ? ListView.builder(
//                             padding: EdgeInsets.zero,
//                             itemCount: languages.length,
//                             itemBuilder: (context, index) {
//                               return RadioListTile<int>(
//                                   contentPadding: EdgeInsets.zero,
//                                   title: Text('${languages[index]}'),
//                                   value: index,
//                                   groupValue: state.selectedLanguage,
//                                   onChanged: (int? value) {
//                                     if (value != null) {
//                                       context
//                                           .read<LanguageBloc>()
//                                           .add(SelectedLanguageEvent(value));
//                                     }
//                                   });
//                             })
//                         : Text('No Settings');
//                   },
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: blackColor,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: InkWell(
//                   onTap: () async {
//                     final sharedPref = await SharedPreferences.getInstance();

//                     sharedPref.setBool(SplashScreenState.loginStatus, false);
//                     context.go('/login');
//                   },
//                   child: Text(
//                     'Log Out',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: blackColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }













// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/language_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Settings extends StatelessWidget {
//   const Settings({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     // List<String> languages = ['English', 'Hindi', 'Marathi', 'Arabic'];
//         // List<String> languagesCodes = ['en', 'hi', 'mr', 'ar'];

//     List<Map<String, String>> languages = [
//       {'code': 'en', 'name': 'English'},
//       {'code': 'hi', 'name': 'Hindi'},
//       {'code': 'mr', 'name': 'Marathi'},
//       {'code': 'ar', 'name': 'Arabic'},
//     ];
    
//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: whitethemeColor,
//         backgroundColor: whitethemeColor,
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Settings',
//             style: TextStyle(
//               fontSize: 20,
//               color: blackColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         elevation: 1,
//         shadowColor: Colors.black,
//       ),
//       backgroundColor: whitethemeColor,
//       body: Container(
//         // padding: EdgeInsets.symmetric(horizontal: 26),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 'Sidd',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: blackColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Divider(
//               thickness: 1,
//               color: blackColor,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 'Language',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: blackColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 30),
//               height: 230,
//               child: BlocBuilder<LanguageBloc, LanguageState>(
      
//                 builder: (context, state) {
//                   return state is LanguageState
//                       ? ListView.builder(
//                           padding: EdgeInsets.zero,
//                           itemCount: languages.length,
//                           itemBuilder: (context, index) {

//                             return RadioListTile<String>(
//                                 contentPadding: EdgeInsets.zero,
//                                 title: Text('${languages[index]['name']}'),
//                                 value: languages[index]['code']!,
//                                 groupValue: state.selectedLanguage,
//                                 onChanged: (String? value) {
//                                   if (value != null) {
//                                     context
//                                         .read<LanguageBloc>()
//                                         .add(SelectedLanguageEvent(value));
//                                   }
//                                 });
//                           },)
//                       : Text('No Settings');
//                 },
//               ),
//             ),
//             Divider(
//               thickness: 1,
//               color: blackColor,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: InkWell(
//                 onTap: () async {
//                   final sharedPref = await SharedPreferences.getInstance();
      
//                   sharedPref.setBool(SplashScreenState.loginStatus, false);
//                   context.go('/login');
//                 },
//                 child: Text(
//                   'Log Out',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: blackColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/language_bloc.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/settings_bloc.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/settings_events.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Settings extends StatelessWidget {
//   const Settings({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> languages = [
//       {'code': 'en', 'name': 'English'},
//       {'code': 'hi', 'name': 'Hindi'},
//       {'code': 'mr', 'name': 'Marathi'},
//       {'code': 'ar', 'name': 'Arabic'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: whitethemeColor,
//         backgroundColor: whitethemeColor,
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Settings',
//             style: TextStyle(
//               fontSize: 20,
//               color: blackColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         elevation: 1,
//         shadowColor: Colors.black,
//       ),
//       backgroundColor: whitethemeColor,
//       body: BlocProvider(
//         create: (context) => LanguageBloc(),
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   'Sidd',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: blackColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Divider(
//                 thickness: 1,
//                 color: blackColor,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   'Language',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: blackColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 height: 230,
//                 child: BlocBuilder<LanguageBloc, LanguageState>(
//                   builder: (context, state) {
//                     return state is CurrentLanguageState
//                         ? ListView.builder(
//                             padding: EdgeInsets.zero,
//                             itemCount: languages.length,
//                             itemBuilder: (context, index) {
//                               return RadioListTile<String>(
//                                 contentPadding: EdgeInsets.zero,
//                                 title: Text(languages[index]['name']!),
//                                 value: languages[index]['code']!,
//                                 groupValue: state.selectedLanguage,
//                                 onChanged: (String? value) {
//                                   if (value != null) {
//                                     context
//                                         .read<LanguageBloc>()
//                                         .add(SelectedLanguageEvent(value));
//                                   }
//                                 },
//                               );
//                             },
//                           )
//                         : Text('No Settings');
//                   },
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: blackColor,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: InkWell(
//                   onTap: () async {
//                     final sharedPref = await SharedPreferences.getInstance();
//                     sharedPref.setBool(SplashScreenState.loginStatus, false);
//                     context.go('/login');
//                   },
//                   child: Text(
//                     'Log Out',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: blackColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
