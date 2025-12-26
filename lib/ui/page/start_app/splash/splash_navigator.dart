
import 'package:finance_management/common/app_navigator.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:go_router/go_router.dart';

class SplashNavigator extends AppNavigator {
  SplashNavigator({required super.context});

  void goHome() {
    context.go(AppRouter.home);
  }
  void goSignIn() {
    context.go(AppRouter.signIn);

  }

  void goSignUp() {
    context.go(AppRouter.signUp);
  }


}
