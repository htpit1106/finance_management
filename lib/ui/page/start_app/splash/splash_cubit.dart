import 'package:bloc/bloc.dart';
import 'package:finance_management/ui/page/start_app/splash/splash_navigator.dart';
import 'package:finance_management/ui/page/start_app/splash/splash_state.dart';



class SplashCubit extends Cubit<SplashState> {
  final SplashNavigator navigator;

  SplashCubit({required this.navigator}) : super(SplashState());

  // onPress LogIn
  void onPressLogIn(){
    navigator.goSignIn();
  }

  void onPressSignUp(){
    navigator.goSignUp();
  }


}