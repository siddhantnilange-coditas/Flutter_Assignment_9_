import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_bloc.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_state.dart';

class AuthorDetail extends StatelessWidget {
  const AuthorDetail({super.key, required this.index});
  // final List <String> author;
  final int index;
  // String capitalizeFirstLetter(String text) {
  //   if (text.isEmpty) return text;

  //   return text[0].toUpperCase() + text.substring(1);
  // }

  @override
  Widget build(BuildContext context) {
    // final capitalizedBookIndex = capitalizeFirstLetter(authorIndex);
    // final String author = authors[index];

    return BlocProvider(
      create: (_) => AuthorsBloc()..add(LoadAuthorDetails(index)),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitethemeColor,
          backgroundColor: whitethemeColor,
          elevation: 1,
          shadowColor: Colors.black,
          title: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("AuthorsData")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  var docs = snapshot.data!.docs;

                  return Text(
                    // docs[index]['AuthorName'],
                    '${snapshot.data!.docs[index]["AuthorsName"]}',

                    style: TextStyle(
                      fontSize: 20,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Text('No Data Found');
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        backgroundColor: whitethemeColor,
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("AuthorsData").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                // var books = snapshot.data!.docs;
                return BlocBuilder<AuthorsBloc, AuthorsState>(
                  builder: (context, state) {
                    if (state is AuthorLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AuthorDetailsLoaded) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              '${snapshot.data!.docs[index]["AuthorsDescription"]}',

                              // '${state.author} Description',
                              style: TextStyle(
                                fontSize: 20,
                                color: blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
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

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/features/author/presentation/bloc/authors_bloc.dart';
// import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
// import 'package:navigation_assignment/features/author/presentation/bloc/authors_state.dart';
// import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

// class AuthorDetail extends StatelessWidget {
//   const AuthorDetail({super.key, required this.index});
//   // final List <String> author;
//   final int index;
//   // String capitalizeFirstLetter(String text) {
//   //   if (text.isEmpty) return text;

//   //   return text[0].toUpperCase() + text.substring(1);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // final capitalizedBookIndex = capitalizeFirstLetter(authorIndex);
//     // final String author = authors[index];

//     return BlocProvider(
//       create: (_) => AuthorsBloc()..add(LoadAuthorDetails(index)),
//       child: Scaffold(
//         appBar: AppBar(
//           surfaceTintColor: whitethemeColor,
//           backgroundColor: whitethemeColor,
//           title: BlocBuilder<AuthorsBloc, AuthorsState>(
//             builder: (context, state) {
//               if (state is AuthorDetailsLoaded) {
//                 return Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     state.author,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: blackColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 );
//               }
//               return Container();
//             },
//           ),
//           elevation: 1,
//           shadowColor: Colors.black,
//         ),
//         backgroundColor: whitethemeColor,
//         body: BlocBuilder<AuthorsBloc, AuthorsState>(
//           builder: (context, state) {
//             if (state is AuthorLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is AuthorDetailsLoaded) {
//               return Container(
//                 padding: EdgeInsets.symmetric(horizontal: 26),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Text(
//                       '${state.author} Description',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: blackColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Spacer(),
//                   ],
//                 ),
//               );
//             } else if (state is AuthorError) {
//               return Center(child: Text(state.message));
//             } else {
//               return Container();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
