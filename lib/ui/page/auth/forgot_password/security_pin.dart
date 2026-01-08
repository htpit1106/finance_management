import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/common/app_themes.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class SecurityPinPage extends StatelessWidget {
  const SecurityPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SecurityPinPageChild();
  }
}
class SecurityPinPageChild extends StatefulWidget {
  const SecurityPinPageChild({super.key});

  @override
  State<SecurityPinPageChild> createState() => _SecurityPinPageChildState();
}

class _SecurityPinPageChildState extends State<SecurityPinPageChild> {
  @override
  Widget build(BuildContext context) {
    return  BackgroundApp(
      heightHeader: 250,
      header: Center(child: Text("Security Pin", style: AppTextStyle.greenDarkS30)),
      body: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    return SingleChildScrollView(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Enter Security Pin",
            style: AppTextStyle.greenDarkSemiBoldS20,
          ),
          const SizedBox(height: 40),

          Pinput(
            length: 6,
            defaultPinTheme: AppThemes.defaultPinTheme,
            focusedPinTheme: AppThemes.focusedPinTheme,
            submittedPinTheme: AppThemes.submittedPinTheme,
            errorPinTheme: AppThemes.errorPinTheme,

            separatorBuilder: (index) => const SizedBox(width: 10),
            validator: (s) => s == '123456' ? null : 'Pin is incorrect',
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),

          const SizedBox(height: 40),

          AppTextButton(
            minWidth: 170,
            text: "Accept",
            onTap: () {
              context.push(AppRouter.newPassword);
            },
            backgroundColor: AppColors.greenBtn,
          ),


          AppTextButton(
            minWidth: 170,
            text: "Send Again",
            onTap: () {},
            backgroundColor: AppColors.lightGreenBtn,
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

