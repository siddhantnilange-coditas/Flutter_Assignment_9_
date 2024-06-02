import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';

final List<String> books = [
  'Book one',
  'Book two',
  'Book three',
  'Book four',
  'Book five',
];
final List<String> authors = [
  'Author one',
  'Author two',
  'Author three',
  'Author four',
  'Author five',
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whitethemeColor,
        backgroundColor: whitethemeColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Home',
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
          Padding(
            padding: const EdgeInsets.only(left: 13, bottom: 17, top: 39),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Books',
                style: TextStyle(
                  fontSize: 20,
                  color: blackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            // padding: EdgeInsets.symmetric(horizontal: 13),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          MyAppRouteConstants.bookdetailsRouteName,
                          extra: index,
                        );
                      },
                      title: Text(
                        // 'Book $index',
                        books[index],
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: blackColor,
                          ),
                      ),
                    ),
                    Divider(
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, bottom: 17, top: 39),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Authors',
                style: TextStyle(
                    fontSize: 20,
                    color: blackColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: authors.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          MyAppRouteConstants.authorsDetailsRouteName,
                          extra: index,
                        );
                      },
                      title: Text(
                        // 'Authors $index',
                        authors[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: blackColor,
                        ),
                      ),
                    ),
                    Divider(
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
