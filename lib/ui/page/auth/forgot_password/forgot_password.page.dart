import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label.dart';
import 'package:finance_management/utils/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordPageChild();
  }
}

class ForgotPasswordPageChild extends StatefulWidget {
  const ForgotPasswordPageChild({super.key});

  @override
  State<ForgotPasswordPageChild> createState() => _ForgotPasswordPageChildState();
}

class _ForgotPasswordPageChildState extends State<ForgotPasswordPageChild> {
  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
        heightHeader: 250,
        header: Center(child: Text("Forgot Password", style: AppTextStyle.greenDarkS30)),
        body: _buildBodyPage(),
      );

  }

  Widget _buildBodyPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("Reset password? ", style: AppTextStyle.greenDarkBoldS20, ),
          Text(
            "Please enter your email address. You will receive a link to create a new password via email. ",
            style: AppTextStyle.greenDarkLightS12,
          ),
          SizedBox(height: 40),
          AppTextFieldLabel(
            labelText: "Enter Email Address",
            hintText: "example@example.com",
            validator: AppValidator.validateEmail,
          ),
          SizedBox(height: 40),

          Center(
            child: AppTextButton(
              minWidth: 170,
              minHeight: 32,
              textButton: "Next Step",
              onTap: () {
                context.push(AppRouter.securityPin);

              },
              backgroundColor: AppColors.greenBtn,
            ),
          )
        ],
      ),
    );
  }
}
