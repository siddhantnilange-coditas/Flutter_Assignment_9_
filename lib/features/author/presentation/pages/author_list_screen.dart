import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_bloc.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_state.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

// final List<String> author = ['Author one', 'Author two', 'Author three', 'Author four', 'Author five'];

class AuthorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthorsBloc()..add(LoadAuthors()),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitethemeColor,
          backgroundColor: whitethemeColor,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Authors',
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
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection("AuthorsData").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                // var books = snapshot.data!.docs;
               return BlocBuilder<AuthorsBloc, AuthorsState>(
                  builder: (context, state) {
                    if (state is AuthorLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AuthorsLoaded) {
                      return ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  //  BlocProvider.of<AuthorsBloc>(context)
                                  //   .add(LoadAuthorDetails(index));
                                  context.pushNamed(
                                    MyAppRouteConstants
                                        .authorsDetailsRouteNametwo,
                                    extra: index,
                                  );
                                },
                                title: Text(
                                  // 'Book $index',
                                  '${snapshot.data!.docs[index]["AuthorsName"]}',

                                  // state.authors[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: blackColor),
                                ),
                              ),
                              Divider(
                                height: 0,
                              ),
                            ],
                          );
                        },
                      );
                    } else if (state is AuthorError) {
                      return Center(child: Text(state.message));
                    } else {
                      return Container();
                    }
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                return Center(child: Text('No Data Found'));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/core/services/page_route_constants.dart';
// import 'package:navigation_assignment/features/author/presentation/bloc/authors_bloc.dart';
// import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
// import 'package:navigation_assignment/features/author/presentation/bloc/authors_state.dart';
// import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

// // final List<String> author = ['Author one', 'Author two', 'Author three', 'Author four', 'Author five'];

// class AuthorsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => AuthorsBloc()..add(LoadAuthors()),
//       child: Scaffold(
//         appBar: AppBar(
//           surfaceTintColor: whitethemeColor,
//           backgroundColor: whitethemeColor,
//           title: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Authors',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: blackColor,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           elevation: 1,
//           shadowColor: Colors.black,
//         ),
//         backgroundColor: whitethemeColor,
        // body: BlocBuilder<AuthorsBloc, AuthorsState>(
        //   builder: (context, state) {
        //     if (state is AuthorLoading) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (state is AuthorsLoaded) {
        //       return ListView.builder(
        //         padding: EdgeInsets.all(0),
        //         itemCount: authors.length,
        //         itemBuilder: (context, index) {
        //           return Column(
        //             children: [
        //               ListTile(
        //                 onTap: () {
        //                     //  BlocProvider.of<AuthorsBloc>(context)
        //                     //   .add(LoadAuthorDetails(index));
        //                   context.pushNamed(
        //                     MyAppRouteConstants.authorsDetailsRouteNametwo,
        //                     extra: index,
        //                   );
        //                 },
        //                 title: Text(
        //                   // 'Book $index',
        //                   state.authors[index],
        //                   style: TextStyle(
        //                       fontSize: 12,
        //                       fontWeight: FontWeight.w400,
        //                       color: blackColor),
        //                 ),
        //               ),
        //               Divider(
        //                 height: 0,
        //               ),
        //             ],
        //           );
        //         },
        //       );
        //     } else if (state is AuthorError) {
        //       return Center(child: Text(state.message));
        //     } else {
        //       return Container();
        //     }
        //   },
//         // ),
//       ),
//     );
//   }
// }






