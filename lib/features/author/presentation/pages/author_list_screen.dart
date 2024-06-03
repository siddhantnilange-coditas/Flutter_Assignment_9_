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
        body: BlocBuilder<AuthorsBloc, AuthorsState>(
          builder: (context, state) {
            if (state is AuthorLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is AuthorsLoaded) {
              return ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: authors.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                            //  BlocProvider.of<AuthorsBloc>(context)
                            //   .add(LoadAuthorDetails(index));
                          context.pushNamed(
                            MyAppRouteConstants.authorsDetailsRouteNametwo,
                            extra: index,
                          );
                        },
                        title: Text(
                          // 'Book $index',
                          state.authors[index],
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
        ),
      ),
    );
  }
}
