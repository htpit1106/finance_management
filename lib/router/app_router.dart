import 'package:finance_management/ui/page/analysis/analysis_page.dart';
import 'package:finance_management/ui/page/auth/forgot_password/forgot_password.page.dart';
import 'package:finance_management/ui/page/auth/forgot_password/new_password.dart';
import 'package:finance_management/ui/page/auth/forgot_password/security_pin.dart';
import 'package:finance_management/ui/page/categories/add_expenses/add_expenses_page.dart';
import 'package:finance_management/ui/page/categories/category_transaction/category_transaction_page.dart';
import 'package:finance_management/ui/page/home/home_page.dart';
import 'package:finance_management/ui/page/main/main_page.dart';
import 'package:finance_management/ui/page/profile/profile_page.dart';
import 'package:finance_management/ui/page/start_app/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/page/analysis/calender/calender_page.dart';
import '../ui/page/analysis/search/search_page.dart';
import '../ui/page/auth/sign_in/sign_in_page.dart';
import '../ui/page/auth/sign_up/sign_up_page.dart';
import '../ui/page/categories/categories_page.dart';
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
  static final String searchPage = "/search_page";
  static final String calenderPage = "/calender_page";
  static final String analysis = "/analysis";
  static final String categories = "/categories";
  static final String categoryTransaction = "/category_transaction";
  static final String addExpenses = "/add_expenses";

  static final navigationKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: splash, name: splash, builder: (context, state) => SplashPage()),
      GoRoute(path: onboarding, name: onboarding, builder: (context, state) => OnboardingPage()),

      GoRoute(path: signUp, name: signUp, builder: (context, state) => SignUpPage()),
      GoRoute(path: signIn, name: signIn, builder: (context, state) => SignInPage()),

      GoRoute(
        path: forgotPassword,
        name: forgotPassword,
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(path: securityPin, name: securityPin, builder: (context, state) => SecurityPinPage()),
      GoRoute(path: newPassword, name: newPassword, builder: (context, state) => NewPasswordPage()),
      GoRoute(path: searchPage, name: searchPage, builder: (context, state) => SearchPage()),

      GoRoute(path: calenderPage, name: calenderPage, builder: (context, state) => CalenderPage()),
      GoRoute(
        path: categoryTransaction,
        name: categoryTransaction,
        builder: (context, state) {
          final category = state.extra as String;
          return CategoryTransactionPage(category: category);
        },
      ),
      GoRoute(
        path: addExpenses,
        name: addExpenses,
        builder: (context, state) => const AddExpensesPage(),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return MainPage(child: child);
        },
        routes: [
          GoRoute(path: profile, name: profile, builder: (context, state) => ProfilePage()),
          GoRoute(path: home, name: home, builder: (context, state) => HomePage()),
          GoRoute(path: analysis, name: analysis, builder: (context, state) => AnalysisPage()),
          GoRoute(
            path: categories,
            name: categories,
            builder: (context, state) => CategoriesPage(),
          ),
        ],
      ),
    ],
    initialLocation: splash,
    debugLogDiagnostics: false,
    navigatorKey: navigationKey,
  );
}
