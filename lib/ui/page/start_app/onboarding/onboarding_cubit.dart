import 'package:bloc/bloc.dart';

import 'onboarding_navigator.dart';
import 'onboarding_state.dart';


class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingNavigator navigator;
  OnboardingCubit({required this.navigator}) : super(OnboardingInitial());
  void goToFinal() => emit(OnboardingFinal());
  void goSignInPage(){
    navigator.toSignIn();
  }
}


