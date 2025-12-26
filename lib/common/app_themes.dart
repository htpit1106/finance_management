import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'app_colors.dart';

class AppThemes {

  static ThemeData get lightTheme {
    return  ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: AppColors.blackText, fontSize: 16, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(color: AppColors.blackText, fontSize: 14, fontWeight: FontWeight.w300),

      ),
      inputDecorationTheme:  InputDecorationTheme(
      hintStyle: AppTextStyle.greenDarkMediumS14,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      filled: true,
      fillColor: AppColors.lightGreenBtn,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none
      ),
      )
    );
  }

  static ThemeData get darkTheme {
    return  ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.darkBackground,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          bodySmall: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyle.greenDarkMediumS14,
        iconColor: AppColors.greenBtn,
        contentPadding: EdgeInsets.symmetric( vertical: 8, horizontal: 16),
        filled: true,

        isDense: true,
        fillColor: AppColors.lightGreenBtn,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none
        ),
      ),


    );
  }


  // app pin theme


  static final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white



    ),
  );

  static final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: AppColors.greenBtn, width: 2),
  );

  static final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      border: Border.all(color: AppColors.greenBtn, width: 2),

    ),
  );

  // errror pin theeme
  static final errorPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Colors.redAccent),
  );

}