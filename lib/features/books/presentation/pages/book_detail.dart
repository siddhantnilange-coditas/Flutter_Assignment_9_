import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_bloc.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_event.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_state.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    // final String book = books[index];

    return BlocProvider(
      create: (_) => BooksBloc()..add(LoadBooksDetails(index)),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitethemeColor,
          backgroundColor: whitethemeColor,
          title: BlocBuilder<BooksBloc, BooksState>(
            builder: (context, state) {
              if (state is BooksDetailsLoaded) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    // state.book,
                    'Book Details',
                    
                    style: TextStyle(
                      fontSize: 20,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
          elevation: 1,
          shadowColor: Colors.black,
        ),
        backgroundColor: whitethemeColor,
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("BooksDetails").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                // var books = snapshot.data!.docs;
                return BlocBuilder<BooksBloc, BooksState>(
                  builder: (context, state) {
                    if (state is BooksLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is BooksDetailsLoaded) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                                  '${snapshot.data!.docs[index]["BookDescription"]}',
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
                    } else if (state is BooksError) {
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
        ), // body: BlocBuilder<BooksBloc, BooksState>(

        //   builder: (context, state) {
        //      if (state is BooksLoading) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //      else if (state is BooksDetailsLoaded) {

        //     return Container(
        //       padding: EdgeInsets.symmetric(horizontal: 26),
        //       child: Column(
        //         children: [
        //           SizedBox(
        //             height: 40,
        //           ),
        //           Text(
        //             '${state.book} Description',

        //             style: TextStyle(
        //               fontSize: 20,
        //               color: blackColor,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //           Spacer(),
        //         ],
        //       ),
        //     );
        //      }
        //      else if (state is BooksError) {
        //       return Center(child: Text(state.message));
        //     } else {
        //       return Container();
        //     }
        //   },

        // ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/features/books/presentation/bloc/books_bloc.dart';
// import 'package:navigation_assignment/features/books/presentation/bloc/books_event.dart';
// import 'package:navigation_assignment/features/books/presentation/bloc/books_state.dart';
// import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

// class BookDetail extends StatelessWidget {
//   const BookDetail({
//     super.key,
//     required this.index,
//   });
//   final String index;

//   @override
//   Widget build(BuildContext context) {
//     // final String book = books[index];

//     return BlocProvider(
//       create: (_) => BooksBloc()..add(LoadBooksDetails(index)),
//       child: Scaffold(
//         appBar: AppBar(
//           surfaceTintColor: whitethemeColor,
//           backgroundColor: whitethemeColor,
//           title: BlocBuilder<BooksBloc, BooksState>(
//             builder: (context, state) {
//               if (state is BooksDetailsLoaded) {
//                 return Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     state.book,
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
//         body: BlocBuilder<BooksBloc, BooksState>(

//           builder: (context, state) {
//              if (state is BooksLoading) {
//               return Center(child: CircularProgressIndicator());
//             }
//              else if (state is BooksDetailsLoaded) {

//             return Container(
//               padding: EdgeInsets.symmetric(horizontal: 26),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Text(
//                     '${state.book} Description',

//                     style: TextStyle(
//                       fontSize: 20,
//                       color: blackColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Spacer(),
//                 ],
//               ),
//             );
//              }
//              else if (state is BooksError) {
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
