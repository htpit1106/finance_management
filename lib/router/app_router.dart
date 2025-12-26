import 'package:finance_management/ui/page/auth/forgot_password/forgot_password.page.dart';
import 'package:finance_management/ui/page/auth/forgot_password/new_password.dart';
import 'package:finance_management/ui/page/auth/forgot_password/security_pin.dart';
import 'package:finance_management/ui/page/main/main_page.dart';
import 'package:finance_management/ui/page/start_app/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/page/auth/sign_in/sign_in_page.dart';
import '../ui/page/auth/sign_up/sign_up_page.dart';
import '../ui/page/start_app/onboarding/onboarding_page.dart';

class AppRouter {
  AppRouter._();

  static const String splash = "/";
  static const String onboarding = "/onboarding";
  static const String home = "/home";
  static const String addTask = "/add_task";
  static const String signIn = "/sign_in";
  static const String signUp = "/sign_up";
  static final String profile = "/profile";
  static final String updateProfile = "/update_profile";
  static final String forgotPassword = "/forgot_password";
  static final String securityPin = "/security_pin";
  static final String newPassword = "/new_password";
  static final navigationKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: splash, name: splash, builder: (context, state) => SplashPage()),
      GoRoute(path: onboarding, name: onboarding, builder: (context, state) => OnboardingPage()),
      GoRoute(path: home, name: home, builder: (context, state) => MainPage()),

      GoRoute(path: signUp, name: signUp, builder: (context, state) => SignUpPage()),
      GoRoute(path: signIn, name: signIn, builder: (context, state) => SignInPage()),

      GoRoute(
        path: forgotPassword,
        name: forgotPassword,
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(
        path: securityPin,
        name: securityPin,
        builder: (context, state) => SecurityPinPage(),
      ),
      GoRoute(
        path: newPassword,
        name: newPassword,
        builder: (context, state) => NewPasswordPage(),
      )
    ],
    initialLocation: splash,
    debugLogDiagnostics: false,
    navigatorKey: navigationKey,
  );
}
