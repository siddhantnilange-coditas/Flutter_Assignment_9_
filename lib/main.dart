//imp
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_assignment/core/dependency_injection/singleton_locator.dart';
import 'package:navigation_assignment/core/services/routes.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// .dart_tool/flutter_gen/gen_l10n/app_localizations.dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navigation_assignment/features/notification.dart/firebase_api.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/language_bloc.dart';
import 'package:navigation_assignment/firebase_options.dart';

Future<void> main() async {
  setDi();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);

  await FirebaseApi().initNotifications();
  FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      
      return true;
    };
  runApp(BlocProvider(
    create: (context) => LanguageBloc(),
    child: const MyApp(),
  ));
}

// void main() {
//   runApp(
//     MyApp(),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    final FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          home: MaterialApp.router(
            routerConfig: router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            // localizationsDelegates: [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            locale: state is LanguageState
                ? _indexToLocale(state.selectedIndex)
                : const Locale('en'),

            supportedLocales: [
              Locale('en'),
              Locale('mr'),
              Locale('hi'),
              Locale('ar'),

              // Spanish
            ],
            builder: (context, child) {
              return Navigator(
                observers: [observer],
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => child!,
                  settings: settings,
                ),
              );
            },
            //  AuthorsScreen(),
          ),
        );
      },
    );
    // return MaterialApp(
    //   home: Login(),
    // );
  }

  Locale _indexToLocale(int index) {
    switch (index) {
      case 1:
        return const Locale('en');
      case 2:
        return const Locale('hi');
      case 3:
        return const Locale('mr');
      case 4:
        return const Locale('ar');

      default:
        return const Locale('en');
    }
  }
}

void changeLanguage(BuildContext context, int index) {
  context.read<LanguageBloc>().add(SelectedLanguageEvent(index));
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:navigation_assignment/core/dependency_injection/singleton_locator.dart';
// import 'package:navigation_assignment/core/services/routes.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:navigation_assignment/features/notification.dart/firebase_api.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/language_bloc.dart';
// import 'package:navigation_assignment/firebase_options.dart';



// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message: ${message.messageId}');
//   FirebaseApi().handleBackgroundMessage(message);
// }

// // void testMethod() async{

// // }


// void main() async {
  
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//  setDi();
//   FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   await FirebaseApi().initNotifications();

//     // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

//   // await flutterLocalNotificationsPlugin
//   //     .resolvePlatformSpecificImplementation<
//   //         AndroidFlutterLocalNotificationsPlugin>()
//   //     ?.createNotificationChannel(channel);

//   // FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
//   // await PushNotificationService().initNotifications();
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   runApp(BlocProvider(
//     create: (context) => LanguageBloc(),
//     child: const MyApp(),
//   ));
// }

// // @pragma('vm:entry-point')
// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   await Firebase.initializeApp();
// // }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LanguageBloc, LanguageState>(
//       builder: (context, state) {
//         return MaterialApp.router(
//           routerConfig: router,
//           localizationsDelegates: AppLocalizations.localizationsDelegates,
//           supportedLocales: const [
//             Locale('en'),
//             Locale('hi'),
//             Locale('mr'),
//             Locale('ar'),
//           ],
//           locale: state is LanguageState
//               ? _indexToLocale(state.selectedIndex)
//               : const Locale('en'),
//         );
//       },
//     );
//   }

//   Locale _indexToLocale(int index) {
//     switch (index) {
//       case 1:
//         return const Locale('en');
//       case 2:
//         return const Locale('hi');
//       case 3:
//         return const Locale('mr');
//       case 4:
//         return const Locale('ar');
//       default:
//         return const Locale('en');
//     }
//   }
// }

// void changeLanguage(BuildContext context, int index) {
//   context.read<LanguageBloc>().add(SelectedLanguageEvent(index));
// }





