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
    final String book = books[index];

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
                    state.book,
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
        body: BlocBuilder<BooksBloc, BooksState>(

          builder: (context, state) {
             if (state is BooksLoading) {
              return Center(child: CircularProgressIndicator());
            } 
             else if (state is BooksDetailsLoaded) {
              
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '${state.book} Description',
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
             }
             else if (state is BooksError) {
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
