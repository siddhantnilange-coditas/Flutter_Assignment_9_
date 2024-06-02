import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

class booksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<String> books = [
    //   'Book one',
    //   'Book two',
    //   'Book three',
    //   'Book four',
    //   'Book five'
    // ];

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whitethemeColor,
        backgroundColor: whitethemeColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Books',
            style: TextStyle(
                fontSize: 20, color: blackColor, fontWeight: FontWeight.w500),
          ),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      backgroundColor: whitethemeColor,
      body: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                // contentPadding: EdgeInsets.only(left: 13),
                onTap: () {
                  context.pushNamed(
                    MyAppRouteConstants.bookDetailsRouteNameTwo,
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
    );
  }
}
