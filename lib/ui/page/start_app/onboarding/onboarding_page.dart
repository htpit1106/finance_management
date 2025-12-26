import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_images.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_cubit.dart';
import 'onboarding_navigator.dart';
import 'onboarding_state.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (context) => OnboardingCubit(navigator: OnboardingNavigator(context: context)),
      child: OnboardingPageChild(),
    );
  }
}

class OnboardingPageChild extends StatefulWidget {
  const OnboardingPageChild({super.key});

  @override
  State<OnboardingPageChild> createState() => _OnboardingPageChildState();
}

class _OnboardingPageChildState extends State<OnboardingPageChild> {
  late final OnboardingCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<OnboardingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingInitial) {
          return onboardingFirstPage();
        }
        return onboardingSecondPage();
      }
    );
  }

  Widget onboardingFirstPage() {
    return BackgroundApp(
      header: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Center(child: Text("Welcome To Expense Manager", textAlign: TextAlign.center)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.onboardingImg1, width: 287, height: 287,),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              _cubit.goToFinal();
            },
            child: Text("Next", style: AppTextStyle.greenDarkS30),
          ),
          SizedBox(height: 10),
          Image.asset(AppIcons.icNext1),
        ],
      ),
    );
  }

  Widget onboardingSecondPage() {
    return BackgroundApp(
      header: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Center(child: Text("¿Are you ready to take control of your finances?", textAlign: TextAlign.center)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.onboardingImg2, height: 287, width: 287),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              _cubit.goSignInPage();
            },
            child: Text("Next", style: AppTextStyle.greenDarkS30),
          ),
          SizedBox(height: 10),
          Image.asset(AppIcons.icNext2),
        ],
      ),
    );
  }
}
