import 'package:finance_management/repository/auth_repository.dart';
import 'package:finance_management/repository/category_repository.dart';
import 'package:finance_management/repository/summary_repository.dart';
import 'package:finance_management/repository/profile_repository.dart';
import 'package:finance_management/repository/transaction_repository.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/app_themes.dart';
import 'configs/app_config.dart';

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (_) => AuthRepositoryImpl()),
        RepositoryProvider<ProfileRepository>(create: (_) => ProfileRepositoryImpl()),
        RepositoryProvider<CategoryRepository>(create: (_) => CategoryRepositoryImpl()),
        RepositoryProvider<TransactionRepository>(create: (_) => TransactionRepositoryImpl()),
        RepositoryProvider<SummaryRepository>(
          create: (_) => SummaryRepositoryImpl(),
        ),
      ],
      child: FinanceAppChild(),
    );
  }
}

class FinanceAppChild extends StatefulWidget {
  const FinanceAppChild({super.key});

  @override
  State<FinanceAppChild> createState() => _FinanceAppChildState();
}

class _FinanceAppChildState extends State<FinanceAppChild> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: AppConstants.appName,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      locale: const Locale('en'),
    );
  }
}
