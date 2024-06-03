import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_events.dart';
import 'package:navigation_assignment/features/author/presentation/bloc/authors_state.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_event.dart';
import 'package:navigation_assignment/features/books/presentation/bloc/books_state.dart';
import 'package:navigation_assignment/features/home/presentation/pages/home_screen.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/settings_events.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/settings_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
 BooksBloc() : super(BooksInitial()) {
    on<LoadBooks>(loadBooks);
    on<LoadBooksDetails>(loadBooksDetails);
  }

  FutureOr<void> loadBooks(
      LoadBooks event, Emitter<BooksState> emit) async {
    emit(BooksLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(BooksLoaded(books));
  }

  FutureOr<void> loadBooksDetails(
      LoadBooksDetails event, Emitter<BooksState> emit) async {
    emit(BooksLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(BooksDetailsLoaded(books[event.index]));
  }
}
