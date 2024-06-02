import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

// final List<String> author = ['Author one', 'Author two', 'Author three', 'Author four', 'Author five'];

class AuthorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: whitethemeColor,
        backgroundColor: whitethemeColor,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Authors',
              style: TextStyle(
                  fontSize: 20, color: blackColor, fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      backgroundColor: whitethemeColor,
      body:   ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: authors.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: (){
                        context.pushNamed(
                          MyAppRouteConstants.authorsDetailsRouteNametwo,
                               extra: index,
                          );
                
                      },
                      title: Text(
                        // 'Book $index',
                        authors[index],
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: blackColor),
                      ),
                    ),
                    Divider(height: 0,),
                  ],
                );
              },
            ),
    );
  }
}
