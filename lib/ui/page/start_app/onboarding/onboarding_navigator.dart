import 'package:finance_management/common/app_navigator.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:go_router/go_router.dart';

class OnboardingNavigator extends AppNavigator {
  OnboardingNavigator({required super.context});

  void toSignIn() {
    context.go(AppRouter.signIn);
  }
}
