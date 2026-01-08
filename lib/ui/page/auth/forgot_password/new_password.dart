import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label_password.dart';
import 'package:finance_management/utils/app_validator.dart';
import 'package:flutter/material.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NewPasswordPageChild();
  }
}

class NewPasswordPageChild extends StatefulWidget {
  const NewPasswordPageChild({super.key});

  @override
  State<NewPasswordPageChild> createState() => _NewPasswordPageChildState();
}

class _NewPasswordPageChildState extends State<NewPasswordPageChild> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {


    return BackgroundApp(
      heightHeader: 250,
      header: Center(child: Text("New Password", style: AppTextStyle.greenDarkS30)),
      body: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            const SizedBox(height: 120),

            AppTextButton(
              text: "Change Password",
              onTap: () {},
              backgroundColor: AppColors.greenBtn,
              minWidth: double.infinity,
              minHeight: 45
            ),
          ],
        ),
      ),
    );
  }
}
