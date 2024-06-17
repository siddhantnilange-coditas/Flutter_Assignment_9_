// author_event.dart

abstract class AuthorEvent {

}

class LoadAuthors extends AuthorEvent {}

class LoadAuthorDetails extends AuthorEvent {
  final int index;

  LoadAuthorDetails(this.index);

}
