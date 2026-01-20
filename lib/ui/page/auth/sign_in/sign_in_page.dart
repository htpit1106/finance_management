import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/repository/auth_repository.dart';
import 'package:finance_management/ui/page/auth/sign_in/sign_in_cubit.dart';
import 'package:finance_management/ui/page/auth/sign_in/sign_in_navigator.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label_password.dart';
import 'package:finance_management/utils/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(
        navigator: SignInNavigator(context: context),
        authRepos: context.read<AuthRepository>(),
      ),
      child: SignInPageChild(),
    );
  }
}

class SignInPageChild extends StatefulWidget {
  const SignInPageChild({super.key});

  @override
  State<SignInPageChild> createState() => _SignInPageChildState();
}

class _SignInPageChildState extends State<SignInPageChild> {
  final _formKey = GlobalKey<FormState>();
  late final SignInCubit cubit;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SignInCubit>();
    _emailController = TextEditingController(text: "phuonggm204@gmail.com");
    _passwordController = TextEditingController(text: "123456");
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(heightHeader: 250, header: buildHeader(), body: buildFormBody());
  }

  Widget buildHeader() {
    return Center(child: Text("Welcome", style: AppTextStyle.greenDarkS30));
  }

  Widget buildFormBody() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextFieldLabel(
            labelText: "Username or email",
            hintText: "example@example.com",
            controller: _emailController,
            validator: AppValidator.validateEmail,
          ),
          AppTextFieldLabelPassword(
            labelText: "Password",

            obscureText: true,
            validator: AppValidator.validateEmpty,
            controller: _passwordController,
            obscureTextController: ObscureTextController(),
          ),

          SizedBox(height: 20),
          AppTextButton(
            minHeight: 45,
            minWidth: 200,
            text: "Log In",
            backgroundColor: AppColors.greenBtn,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                cubit.onPressLogIn(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              }
            },
          ),
          GestureDetector(
            onTap: cubit.onPressForgotPassword,
            child: Text("Forget Password?", style: AppTextStyle.greenDarkS14),
          ),
          SizedBox(height: 20),
          Text("or sign up with ", style: AppTextStyle.greenDarkLightS12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.icFacebook, width: 30, height: 30),
              SizedBox(width: 20),
              SvgPicture.asset(AppIcons.icGoogle, width: 30, height: 30),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Use ", style: AppTextStyle.greenDarkS14),
              Text("Fingerprint", style: AppTextStyle.oceanBlueS14),
              Text(" To Access ", style: AppTextStyle.greenDarkS14),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ", style: AppTextStyle.greenDarkLightS12),
              InkWell(
                onTap: cubit.onPressSignUp,
                child: Text("Sign Up", style: AppTextStyle.oceanBlueS12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
