import 'package:finance_management/common/app_navigator.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:go_router/go_router.dart';

class SignUpNavigator extends AppNavigator{
  SignUpNavigator({required super.context});

  void toSignIn(){
    context.push(AppRouter.signIn);
  }

  void goHome(){
    context.go(AppRouter.home);
  }


}