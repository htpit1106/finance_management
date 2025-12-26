import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_images.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/start_app/splash/splash_cubit.dart';
import 'package:finance_management/ui/page/start_app/splash/splash_navigator.dart';
import 'package:finance_management/ui/page/start_app/splash/splash_state.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) {
        return SplashCubit(navigator: SplashNavigator(context: context));
      },
      child: SplashPageChild(),
    );
  }
}

class SplashPageChild extends StatefulWidget {
  const SplashPageChild({super.key});

  @override
  State<SplashPageChild> createState() => _SplashPageChildState();
}

class _SplashPageChildState extends State<SplashPageChild> {
  late final SplashCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SplashCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 3));
      // cubit.autoLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body: _loadedPage(),
        );
      },
    );
  }

  Widget _loadedPage() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30),

      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.splashImg,
            width: 110,
            height: 115,
            color: AppColors.backgroundColor,
          ),
          Text("FinWise", style: AppTextStyle.greenTitle),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do .",
            style: AppTextStyle.greenDarkMediumS14,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 42),
          AppTextButton(
            minWidth: 200,
            minHeight: 45,

            textButton: "Log In",
            backgroundColor: AppColors.greenBtn,
            onTap: () {
              cubit.onPressLogIn();
            },
          ),
          SizedBox(height: 12),

          AppTextButton(
            minWidth: 200,
            minHeight: 45,
            textButton: "Sign Up",
            backgroundColor: AppColors.lightGreenBtn,
            onTap: () {
              cubit.onPressSignUp();
            },
          ),
          SizedBox(height: 12),

          Text("Forget Password?", style: AppTextStyle.greenDarkS14),
        ],
      ),
    );
  }
}
