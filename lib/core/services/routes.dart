import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';
import 'package:navigation_assignment/core/widgets/nav_bar.dart';
import 'package:navigation_assignment/features/authentication/presentation/pages/registration_screen.dart';
import 'package:navigation_assignment/features/author/presentation/pages/author_details.dart';
import 'package:navigation_assignment/features/author/presentation/pages/author_list_screen.dart';
import 'package:navigation_assignment/features/books/presentation/pages/book_detail.dart';
import 'package:navigation_assignment/features/books/presentation/pages/books_list_screen.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';
import 'package:navigation_assignment/features/authentication/presentation/pages/login_screen.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/image_screen_1.dart';
import 'package:navigation_assignment/features/settings/presentation/pages/settings.dart';
import 'package:navigation_assignment/features/on_boarding/presentation/pages/splash_screen.dart';

final homeTabNavigatorKey = GlobalKey<NavigatorState>();
final authorTabNavigatorKey = GlobalKey<NavigatorState>();
final booksTabNavigatorKey = GlobalKey<NavigatorState>();
final settingsTabNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final onboardingTabNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // GoRoute(
    //   path: '/splash-screen',
    //   name: 'splash',
    //   builder: (context, state) => SplashScreen(),
    // ),
    GoRoute(
      path: '/onboarding',
      name: MyAppRouteConstants.onboardingRouteName,
      builder: (context, state) => ImageScreenOne(),
    ),
    GoRoute(
      path: '/login',
      name: MyAppRouteConstants.loginRouteName,
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: '/register',
      name: MyAppRouteConstants.registerRouteName,
      builder: (context, state) => Registration(),
    ),

    //  GoRoute(
    //   path: '/register',
    //   name: MyAppRouteConstants.registerRouteName,
    //   builder: (context, state) => Registration(),
    // ),


    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return NavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: homeTabNavigatorKey,
          routes: [
            GoRoute(
              // initialLocation: '/home',
              // redirect: (context, state) {
              //     return FirebaseAuth.instance.authStateChanges() == true ? '/home' : '/login';
              // },
              path: '/home',
              name: MyAppRouteConstants.homeRouteName,
              // builder: (context, state) => HomeScreen(),
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: HomeScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'books_details',
                  name: MyAppRouteConstants.bookdetailsRouteName,
                  pageBuilder: (context, state) {
                    // final books = state.pathParameters['books'];
                    // final index = state.pathParameters[index];
                    // final books = state.extra as List<String>;
                    final int index = state.extra as int;

                    return MaterialPage(
                      key: state.pageKey,
                      child: BookDetail(
                        // book: books,

                        index: index,
                      ),
                    );
                  },
                ),
                GoRoute(
                  path: 'author_details',
                  name: MyAppRouteConstants.authorsDetailsRouteName,
                  pageBuilder: (context, state) {
                    // final authors = state.extra as List<String>;
                    final int index = state.extra as int;

                    return MaterialPage(
                      key: state.pageKey,
                      child: AuthorDetail(
                          // author: authors,
                          index: index,),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: booksTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/books',
              name: MyAppRouteConstants.authorsRouteName,
              // builder: (context, state) => AuthorsScreen(),
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: BooksScreen(),
                );
              },
              // routes:
              routes: [
                GoRoute(
                  path: 'books_details_two',
                  name: MyAppRouteConstants.bookDetailsRouteNameTwo,
                  pageBuilder: (context, state) {
                    // final books = state.extra as List<String>;
                    final int index = state.extra as int;

                    return MaterialPage(
                      key: state.pageKey,
                      child: BookDetail(
                        // book: books,
                        index: index,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: authorTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/authors',
              name: MyAppRouteConstants.authorTabNaveky,
              // builder: (context, state) => booksScreen(),
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: AuthorsScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'author_details_two',
                  name: MyAppRouteConstants.authorsDetailsRouteNametwo,
                  pageBuilder: (context, state) {
                    final int index = state.extra as int;

                    return MaterialPage(
                      key: state.pageKey,
                      child: AuthorDetail(
                        // author: authors,
                        index: index,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: settingsTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              name: MyAppRouteConstants.settingsRouteName,
              // builder: (context, state) => SettingsScreen(),
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: Settings(),
                );
              },
            ),
          ],
        ),
        // StatefulShellBranch(
        //   navigatorKey: onboardingTabNavigatorKey,
        //   routes: [
        //     GoRoute(
        //       path: '/onboarding',
        //       name: MyAppRouteConstants.onboardingRouteName,
        //       // builder: (context, state) => SettingsScreen(),
        //       pageBuilder: (context, state) {
        //         return MaterialPage(
        //           key: state.pageKey,
        //           child: ImageScreenOne(),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ],
    ),
  ],
);
