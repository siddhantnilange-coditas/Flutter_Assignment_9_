// author_event.dart

abstract class BooksEvent {

}

class LoadBooks extends BooksEvent {}

class LoadBooksDetails extends BooksEvent {
  final int index;

  LoadBooksDetails(this.index);

}


// author_event.dart

// abstract class BooksEvent {

// }

// class LoadBooks extends BooksEvent {}

// class LoadBooksDetails extends BooksEvent {
//   final String index;

//   LoadBooksDetails(this.index);

// }





