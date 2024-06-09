import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navigation_assignment/features/author/presentation/pages/author_list_screen.dart';
import 'package:navigation_assignment/features/books/presentation/pages/books_list_screen.dart';

// final List<String> books = [
//   'Book one',
//   'Book two',
//   'Book three',
//   'Book four',
//   'Book five',
// ];
// final List<String> authors = [
//   'Author one',
//   'Author two',
//   'Author three',
//   'Author four',
//   'Author five',
// ];

class HomeScreen extends StatelessWidget {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {

     _setCurrentScreen() async {
      await analytics.logScreenView(
        screenName: 'HomePage',
        screenClass: 'MyHomePage',
      );
    }
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whitethemeColor,
        backgroundColor: whitethemeColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.home,
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
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 13, bottom: 17, top: 39),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       AppLocalizations.of(context)!.books,
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: blackColor,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            height: 300,
            child: BooksScreen(),
          ),
          
          Container(
            height: 300,
            child: AuthorsScreen(),
          ),
        ],
      ),
    );
  }
}
