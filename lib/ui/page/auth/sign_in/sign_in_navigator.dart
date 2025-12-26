import 'package:finance_management/common/app_navigator.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:go_router/go_router.dart';

class SignInNavigator extends AppNavigator {
  SignInNavigator({required super.context});

  void toSignUp() {
    context.push(AppRouter.signUp);
  }

  void goHome() {
    context.go(AppRouter.home);
  }
  void openForgotPassword() {
    context.push(AppRouter.forgotPassword);
  }
}
