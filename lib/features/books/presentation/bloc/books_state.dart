// author_state.dart

abstract class BooksState {

}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<String> authors;

  BooksLoaded(this.authors);

}

class BooksDetailsLoaded extends BooksState {
  final String book;

 BooksDetailsLoaded(this.book);

}

class BooksError extends BooksState {
  final String message;

  BooksError(this.message);

}
