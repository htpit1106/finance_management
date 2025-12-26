import 'package:bloc/bloc.dart';
import 'package:finance_management/repository/auth_repository.dart';
import 'package:finance_management/ui/page/auth/sign_in/sign_in_navigator.dart';
import 'package:finance_management/ui/page/auth/sign_in/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInNavigator navigator;
  final AuthRepository authRepos;
  SignInCubit({required this.navigator, required this.authRepos}) : super(SignInState());

  void onPressSignUp(){
    navigator.toSignUp();

  }
  Future<void> onPressLogIn({required String email, required String password}) async {
    emit(SignInState(isLoading: true));
    final result = await authRepos.signIn(email, password);
    if (!result){
      emit(SignInState(isLoading: false));
      navigator.showError("Email or password not true");
      return;
    }
    emit(SignInState(isLoading: false));
    navigator.goHome();
  }
  void onPressForgotPassword(){
    navigator.openForgotPassword();
  }

}