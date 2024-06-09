// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:navigation_assignment/core/colors/colors.dart';
// import 'package:navigation_assignment/core/services/page_route_constants.dart';
// import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
// import 'package:navigation_assignment/features/books/presentation/bloc/books_bloc.dart';
// import 'package:navigation_assignment/features/books/presentation/bloc/books_event.dart';
// import 'package:navigation_assignment/features/books/presentation/bloc/books_state.dart';
// import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_bloc.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_event.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_state.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BooksBloc()..add(LoadBooks()),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitethemeColor,
          backgroundColor: whitethemeColor,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.books,
              style: TextStyle(
                  fontSize: 20, color: blackColor, fontWeight: FontWeight.w500),
            ),
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
                    } else if (state is BooksLoaded) {
                      return ListView.builder(
                        padding: EdgeInsets.all(0),
                        // itemCount: books.length,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          // var book = books[index];
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  context.pushNamed(
                                    MyAppRouteConstants.bookDetailsRouteNameTwo,
                                    extra: index,
                                  );
                                },
                                title: Text(
                                  // book['title'],
                                  '${snapshot.data!.docs[index]["BookName"]}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              Divider(height: 0),
                            ],
                          );
                        },
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
        ),
      ),
    );
  }
}

// class booksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final List<String> books = [
//     //   'Book one',
//     //   'Book two',
//     //   'Book three',
//     //   'Book four',
//     //   'Book five'
//     // ];

//     return BlocProvider(
//       create: (_) => BooksBloc()..add(LoadBooks()),
//       child: Scaffold(
//         appBar: AppBar(
//           surfaceTintColor: whitethemeColor,
//           backgroundColor: whitethemeColor,
//           title: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               // 'Books',
//                                   AppLocalizations.of(context)!.books,

//               style: TextStyle(
//                   fontSize: 20, color: blackColor, fontWeight: FontWeight.w500),
//             ),
//           ),
//           elevation: 1,
//           shadowColor: Colors.black,
//         ),
//         backgroundColor: whitethemeColor,
//         body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("BooksDetails").snapshots(),
//         builder: (context, snapshot){
//           if(snapshot.connectionState == ConnectionState.active){
//             if(snapshot.hasData){
//               return  BlocBuilder<BooksBloc, BooksState>(
//           builder: (context, state) {
//             if (state is BooksLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is BooksLoaded) {
//               return ListView.builder(
//                 padding: EdgeInsets.all(0),
//                 itemCount: books.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       ListTile(
//                         // contentPadding: EdgeInsets.only(left: 13),
//                         onTap: () {
//                           // BlocProvider.of<BooksBloc>(context)
//                           //     .add(LoadBooksDetails(index));

//                           context.pushNamed(
//                             MyAppRouteConstants.bookDetailsRouteNameTwo,
//                             extra: index,
//                           );
//                         },
//                         title: Text(
//                           // 'Book $index',
//                                                             AppLocalizations.of(context)!.books[index],

//                           // books[index],
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: blackColor,
//                           ),
//                         ),
//                       ),
//                       Divider(
//                         height: 0,
//                       ),
//                     ],
//                   );
//                 },
//               );
//             } else if (state is BooksError) {
//               return Center(child: Text(state.message));
//             } else {
//               return Container();
//             }
//           },
//         );
//             }
//             else if(snapshot.hasError){
//               Center(child: Text("${snapshot.hasError.toString()}"),);
//             }
//             else{
//               Text('No Data Found');
//             }
//           }
//           else{
//             Center(child: CircularProgressIndicator(),);
//           }
        
//         },
        
//         ),
       
//       ),
//     );
//   }
// }
