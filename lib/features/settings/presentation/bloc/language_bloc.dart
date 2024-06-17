
// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';

// part 'language_event.dart';
// part 'language_state.dart';

// class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
//   LanguageBloc() : super(LanguageState(const Locale('en'), 0)) {
//     on<SelectedLanguageEvent>(_onSelectedLanguageEvent);
//   }

//   FutureOr<void> _onSelectedLanguageEvent(SelectedLanguageEvent event, Emitter<LanguageState> emit) {
//     emit(LanguageState(_indexToLocale(event.selectedIndex), event.selectedIndex));
//   }

//   Locale _indexToLocale(int index) {
//     switch (index) {
//       case 1:
//         return const Locale('mr');
//       case 2:
//         return const Locale('hi');
//       case 3:
//         return const Locale('ar');
//       default:
//         return const Locale('en');
//     }
//   }
// }

///imp

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/settings_events.dart';


part 'language_event.dart';
part 'language_state.dart';




class LanguageBloc extends Bloc<InitialLangugageEvent, LanguageState>{
  LanguageBloc() : super( LanguageState(0)) {
    on<SelectedLanguageEvent>(selectedLanguageEvent);
  }


  FutureOr<void> selectedLanguageEvent(SelectedLanguageEvent event, Emitter<LanguageInitialState> emit) {
        emit(LanguageState(event.selectedIndex));

  }
}






// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'language_event.dart';
// part 'language_state.dart';

// class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
//   LanguageBloc() : super( LanguageInitial(0)) {
//     on<SelectedLanguageEvent>(selectedLanguageEvent);
//   }


//   FutureOr<void> selectedLanguageEvent(SelectedLanguageEvent event, Emitter<LanguageState> emit) {
//         emit(CurrentLanguageState(event.selectedLanguage));

//   }
// }




// class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
//   LanguageBloc() : super(LanguageInitial(0)) {
//         on<SelectedLanguageEvent>(selectedLanguageEvent);


//     // on<LanguageEvent>((event, emit) {
//     //   // TODO: implement event handler
//     // });
//   }
    

  

//   FutureOr<void> selectedLanguageEvent(SelectedLanguageEvent event, Emitter<LanguageState> emit) {

//   }
// }


// class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
//   LanguageBloc() : super(LanguageInitial('en')) {
//         on<SelectedLanguageEvent>(selectedLanguageEvent);

//         _loadInitialLanguage();
//         on<ChangeLanguageEvent>(changeLanguageEvent);

//     // on<LanguageEvent>((event, emit) {
//     //   // TODO: implement event handler
//     // });
//   }
//      Future<void> _loadInitialLanguage() async {
//     final String locale = await getLocale();
//     add(SelectedLanguageEvent(locale));
//   }
//     Future<void> selectedLanguageEvent(SelectedLanguageEvent event, Emitter<LanguageState> emit) async{
//         await setLocale(event.selectedLanguage);
//     emit(CurrentLanguageState(event.selectedLanguage));
//         // emit(LanguageState(event.selectedIndex));

//   }


  
// }
