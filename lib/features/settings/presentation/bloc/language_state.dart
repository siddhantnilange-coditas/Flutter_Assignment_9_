// part of 'language_bloc.dart';

// class LanguageState {
//   final Locale locale;

//    final int selectedIndex;

//   LanguageState(this.locale, this.selectedIndex);
  
// }

//imp

part of 'language_bloc.dart';

abstract class LanguageInitialState{

}

class LanguageState extends LanguageInitialState {
  final int selectedIndex;

   LanguageState(this.selectedIndex);


}
// sealed class LanguageState {}

// final class LanguageInitial extends LanguageState {
//   final int selectedLanguage;

//    LanguageInitial(this.selectedLanguage);
// }

// class CurrentLanguageState extends LanguageState {
//   final int selectedLanguage;

//    CurrentLanguageState(this.selectedLanguage);


// }











// @immutable
// sealed class LanguageState {}

// final class LanguageInitial extends LanguageState {
//   final String selectedLanguage;

//    LanguageInitial(this.selectedLanguage);
// }

// class CurrentLanguageState extends LanguageState {
//   final String selectedLanguage;

//    CurrentLanguageState(this.selectedLanguage);


// }

// class LanguageState extends LaguageInitialState {
//   final String selectedLanguage;

//    LanguageState(this.selectedLanguage);


// }

// class CurrentLanguageState extends LaguageInitialState {
//   final String selectedLanguage;

//    CurrentLanguageState(this.selectedLanguage);


// }

