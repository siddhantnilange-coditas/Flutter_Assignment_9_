// part of 'language_bloc.dart';

// abstract class LanguageEvent {}

// class SelectedLanguageEvent extends LanguageEvent {
//   final int selectedIndex;

//   SelectedLanguageEvent(this.selectedIndex);
// }

// /imp
part of 'language_bloc.dart';


abstract class InitialLangugageEvent{

}

class SelectedLanguageEvent extends InitialLangugageEvent{
   final int selectedIndex;

   SelectedLanguageEvent(this.selectedIndex);
}









// part of 'language_bloc.dart';


// @immutable
// sealed class LanguageEvent {}

// class SelectedLanguageEvent extends LanguageEvent{
//    final int selectedLanguage;

//    SelectedLanguageEvent(this.selectedLanguage);
// }



// @immutable
// sealed class LanguageEvent {}

// class SelectedLanguageEvent extends LanguageEvent{
//    final String selectedLanguage;

//    SelectedLanguageEvent(this.selectedLanguage);
// }

