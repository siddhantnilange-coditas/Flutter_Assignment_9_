import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/core/services/page_route_constants.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_bloc.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_event.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_state.dart';
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

    return BlocProvider(
      create: (_) => BooksBloc()..add(LoadBooks()),
      child: Scaffold(
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
        body: BlocBuilder<BooksBloc, BooksState>(
          builder: (context, state) {
            if (state is BooksLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BooksLoaded) {
              return ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        // contentPadding: EdgeInsets.only(left: 13),
                        onTap: () {
                          // BlocProvider.of<BooksBloc>(context)
                          //     .add(LoadBooksDetails(index));

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
              );
            } else if (state is BooksError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
