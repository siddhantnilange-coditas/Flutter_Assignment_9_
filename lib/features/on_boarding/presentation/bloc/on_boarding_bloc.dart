// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:navigation_assignment/features/on_boarding/presentation/bloc/on_boarding_events.dart';
// import 'package:navigation_assignment/features/on_boarding/presentation/bloc/on_boarding_state.dart';

// class OnboardingBloc extends Bloc<OnboardingInitialEvent, OnboardingState> {
//   OnboardingBloc() : super(OnboardingInitialState()) {
//     on<NextScreenEvent>(_onNextScreenEvent);
//     on<OnboardingInitialEvent>(onboardingInitialEvent);
//   }
//   FutureOr<void> onboardingInitialEvent(
//       OnboardingInitialEvent event, Emitter<OnboardingState> emit) async {
//     // print(11);
//     emit(OnboardingInitialState());
//     // print(2);

//     await Future.delayed(
//       const Duration(seconds: 2),
//     );
//     // print(3);
//     emit(OnBoardingScreensState());

//     // emit(OnBoardingScreensState(introList: introList));
//     print(4);
//   }

//   void _onNextScreenEvent(NextScreenEvent event, Emitter<dynamic> emit) {
//     // Example: Navigator.pushNamed(context, event.path);
//     event.method();
//   }
// }
