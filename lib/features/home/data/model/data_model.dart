

// class DataModel{
//   String username;
//   String email;
//   String password;
//   String books;
//   String boosk
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  String username;
  String email;
  String password;
  List<String> books;
  List<String> authors;

  DataModel({
    required this.username,
    required this.email,
    required this.password,
    required this.books,
    required this.authors,
  });

  // Convert a DataModel into a map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'books': books,
      'authors': authors,
    };
  }

  // Create a DataModel from a map (JSON)
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      books: List<String>.from(json['books'] ?? []),
      authors: List<String>.from(json['authors'] ?? []),
    );
  }

  // Create a DataModel from a Firestore document snapshot
  factory DataModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return DataModel.fromJson(doc.data() as Map<String, dynamic>);
  }
}
