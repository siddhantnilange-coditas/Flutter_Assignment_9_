import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_state.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';


class AuthorsBloc extends Bloc<AuthorEvent, AuthorsState> {
  AuthorsBloc() : super(AuthorInitial()) {
    on<LoadAuthors>(loadAuthors);
    on<LoadAuthorDetails>(loadAuthorDetails);
  }

  FutureOr<void> loadAuthors(
      LoadAuthors event, Emitter<AuthorsState> emit) async {
    emit(AuthorLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(AuthorsLoaded());
  }

  FutureOr<void> loadAuthorDetails(
      LoadAuthorDetails event, Emitter<AuthorsState> emit) async {
    emit(AuthorLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(AuthorDetailsLoaded(event.index));
  }
}
