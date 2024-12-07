import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/settings_events.dart';
import 'package:navigation_assignment/features/settings/presentation/bloc/settings_state.dart';



class LanguageBloc extends Bloc<InitialLangugageEvent, LaguageInitialState> {
  LanguageBloc() : super( LanguageState(0)) {
    on<SelectedLanguageEvent>(selectedLanguageEvent);
  }


  FutureOr<void> selectedLanguageEvent(SelectedLanguageEvent event, Emitter<LaguageInitialState> emit) {
        emit(LanguageState(event.selectedIndex));

  }
}

