import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/repository/auth_repository.dart';
import 'package:finance_management/repository/profile_repository.dart';
import 'package:finance_management/ui/page/auth/sign_up/sign_up_cubit.dart';
import 'package:finance_management/ui/page/auth/sign_up/sign_up_navigator.dart';
import 'package:finance_management/ui/page/auth/sign_up/sign_up_state.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label_password.dart';
import 'package:finance_management/utils/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(
        authRepos: context.read<AuthRepository>(),
        navigator: SignUpNavigator(context: context),
        profileRepos: context.read<ProfileRepository>(),
      ),
      child: SignUpPageChild(),
    );
  }
}

class SignUpPageChild extends StatefulWidget {
  const SignUpPageChild({super.key});

  @override
  State<SignUpPageChild> createState() => _SignUpPageChildState();
}

class _SignUpPageChildState extends State<SignUpPageChild> {
  final _formKey = GlobalKey<FormState>();
  late final SignUpCubit cubit;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _mobileController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;


  @override
  void initState() {
    super.initState();
    cubit = context.read<SignUpCubit>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 200,
      header: Center(child: Text("Create Account", style: AppTextStyle.greenDarkS30)),
      body: buildFormBody(),
    );
  }

  Widget buildFormBody() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextFieldLabel(
              labelText: "Full Name",
              hintText: "John Doe",
              controller: _nameController,
              validator: AppValidator.validateEmpty,
            ),
            AppTextFieldLabel(
              labelText: "Email",
              hintText: "example@example.com",
              controller: _emailController,
              validator: AppValidator.validateEmail,
            ),
            AppTextFieldLabel(
              labelText: "Mobile Number",
              hintText: "0399388404",
              keyboardType: TextInputType.number,
              controller: _mobileController,
              validator: AppValidator.validateMobile,
            ),
            AppTextFieldLabel(
              labelText: "Date Of Birth",
              hintText: "DD / MM / YYYY",
              validator: AppValidator.validateEmpty,
            ),

            AppTextFieldLabelPassword(
              labelText: "Password",
              validator: AppValidator.validateEmpty,
              controller: _passwordController, obscureTextController: ObscureTextController(),
            ),

            AppTextFieldLabelPassword(
              labelText: "Confirm Password",
              validator: (value) => AppValidator.validateConfirmPassword(_passwordController.text,  value),
              controller: _confirmPasswordController,
              obscureTextController: ObscureTextController(),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("By continuing, you agree to ", style: AppTextStyle.greenDarkLightS12),
                Text("Terms of Use and Privacy Policy", style: AppTextStyle.greenDarkS12),
              ],
            ),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return state.isLoading ? CircularProgressIndicator() : AppTextButton(
                  minHeight: 45,
                  minWidth: 200,
                  textButton: "Sign Up",
                  backgroundColor: AppColors.greenBtn,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      cubit.onPressSignUp(
                        fullName: _nameController.text,
                        email: _emailController.text,
                        mobileNumber: _mobileController.text,
                        dateOfBirth: _passwordController.text,
                        password: _passwordController.text,
                      );
                    }
                  },);


              }
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: AppTextStyle.greenDarkLightS12),
                GestureDetector(
                  onTap: cubit.onPressSignIn,

                  child: Text("Log In", style: AppTextStyle.oceanBlueS12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
