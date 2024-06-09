// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:navigation_assignment/core/language_model/languages_contants.dart';
// import 'package:navigation_assignment/features/settings/presentation/bloc/settings_events.dart';



// class LanguageBloc extends Bloc<InitialLangugageEvent, Langu> {
//   LanguageBloc() : super( LanguageState('en')) {
//     on<SelectedLanguageEvent>(selectedLanguageEvent);
//     _loadInitialLanguage();
//   }

//   Future<void> _loadInitialLanguage() async {
//     final String locale = await getLocale();
//     add(SelectedLanguageEvent(locale));
//   }

//   FutureOr<void> selectedLanguageEvent(SelectedLanguageEvent event, Emitter<LaguageInitialState> emit) async{
//         await setLocale(event.selectedLanguage);
//     emit(LanguageState(event.selectedLanguage));
//         // emit(LanguageState(event.selectedIndex));

//   }
// }

