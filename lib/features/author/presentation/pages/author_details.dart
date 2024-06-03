import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:navigation_assignment/core/colors/colors.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_bloc.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_state.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';

class AuthorDetail extends StatelessWidget {
  const AuthorDetail({super.key, required this.index});
  // final List <String> author;
  final int index;
  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;

    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    // final capitalizedBookIndex = capitalizeFirstLetter(authorIndex);
    final String author = authors[index];

    return BlocProvider(
      create: (_) => AuthorsBloc()..add(LoadAuthorDetails(index)),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitethemeColor,
          backgroundColor: whitethemeColor,
          title: BlocBuilder<AuthorsBloc, AuthorsState>(
            builder: (context, state) {
              if (state is AuthorDetailsLoaded) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    state.author,
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
        body: BlocBuilder<AuthorsBloc, AuthorsState>(
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
                      '${state.author} Description',
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
        ),
      ),
    );
  }
}
