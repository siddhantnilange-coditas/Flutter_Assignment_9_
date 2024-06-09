// author_state.dart

abstract class AuthorsState {

}

class AuthorInitial extends AuthorsState {}

class AuthorLoading extends AuthorsState {}

class AuthorsLoaded extends AuthorsState {
  // final List<String> authors;

  // AuthorsLoaded(this.authors);

}

class AuthorDetailsLoaded extends AuthorsState {
  final int index;

  AuthorDetailsLoaded(this.index);

}

class AuthorError extends AuthorsState {
  final String message;

  AuthorError(this.message);

}
