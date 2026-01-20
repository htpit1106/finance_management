import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  // white title
  static final whiteTitle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 56,
  );

  // s20
  static final whiteS20 = whiteTitle.copyWith(fontSize: 20);
  static final whiteS20Bold = whiteTitle.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  static final whiteS20Medium = whiteTitle.copyWith(fontSize: 20, fontWeight: FontWeight.w400);
  static final whiteS20Light = whiteTitle.copyWith(fontSize: 20, fontWeight: FontWeight.w300);

  // s12
  static final whiteS12 = whiteTitle.copyWith(fontSize: 12);
  static final whiteS12Bold = whiteTitle.copyWith(fontSize: 12, fontWeight: FontWeight.w600);
  static final whiteS12Medium = whiteTitle.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
  static final whiteS12Light = whiteTitle.copyWith(fontSize: 12, fontWeight: FontWeight.w300);

  // s14
  static final whiteS14 = whiteTitle.copyWith(fontSize: 14);
  static final whiteS14Bold = whiteTitle.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static final whiteS14Medium = whiteTitle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static final whiteS14Light = whiteTitle.copyWith(fontSize: 14, fontWeight: FontWeight.w300);

  // s15
  static final whiteS15 = whiteTitle.copyWith(fontSize: 15);
  static final whiteS15Bold = whiteTitle.copyWith(fontSize: 15, fontWeight: FontWeight.w600);
  static final whiteS15Medium = whiteTitle.copyWith(fontSize: 15, fontWeight: FontWeight.w400);
  static final whiteS15Light = whiteTitle.copyWith(fontSize: 15, fontWeight: FontWeight.w300);

  // green
  static final greenTitle = TextStyle(
    color: AppColors.greenText,
    fontWeight: FontWeight.w600,
    fontSize: 56,
  );

  // hint text
  // opacity = 45
  static final hintText = TextStyle(
    color: AppColors.hintText,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  // dark green
  static final greenDark = TextStyle(color: AppColors.greenDarkText, fontWeight: FontWeight.w500);

  //s12
  static final greenDarkS12 = greenDark.copyWith(fontSize: 12);
  static final greenDarkMediumS12 = greenDark.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
  static final greenDarkBoldS12 = greenDark.copyWith(fontSize: 12, fontWeight: FontWeight.w600);
  static final greenDarkLightS12 = greenDark.copyWith(fontSize: 12, fontWeight: FontWeight.w300);
  // s13
  static final greenDarkS13 = greenDark.copyWith(fontSize: 13);
  static final greenDarkMediumS13 = greenDark.copyWith(fontSize: 13, fontWeight: FontWeight.w400);
  static final greenDarkBoldS13 = greenDark.copyWith(fontSize: 13, fontWeight: FontWeight.w600);
  static final greenDarkLightS13 = greenDark.copyWith(fontSize: 13, fontWeight: FontWeight.w300);

  // s14
  static final greenDarkS14 = greenDark.copyWith(fontSize: 14);
  static final greenDarkMediumS14 = greenDark.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static final greenDarkBoldS14 = greenDark.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static final greenDarkLightS14 = greenDark.copyWith(fontSize: 14, fontWeight: FontWeight.w300);

  //s20
  static final greenDarkS20 = greenDark.copyWith(fontSize: 20);
  static final greenDarkMediumS20 = greenDark.copyWith(fontSize: 20, fontWeight: FontWeight.w400);
  static final greenDarkBoldS20 = greenDark.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  static final greenDarkSemiBoldS20 = greenDark.copyWith(fontSize: 20, fontWeight: FontWeight.w500);
  static final greenDarkLightS20 = greenDark.copyWith(fontSize: 20, fontWeight: FontWeight.w300);

  //s30
  static final greenDarkS30 = greenDark.copyWith(fontSize: 30);
  static final greenDarkMediumS30 = greenDark.copyWith(fontSize: 30, fontWeight: FontWeight.w400);
  static final greenDarkBoldS30 = greenDark.copyWith(fontSize: 30, fontWeight: FontWeight.w600);
  static final greenDarkLightS30 = greenDark.copyWith(fontSize: 30, fontWeight: FontWeight.w300);

  // s15
  static final greenDarkS15 = greenDark.copyWith(fontSize: 15);
  static final greenDarkMediumS15 = greenDark.copyWith(fontSize: 15, fontWeight: FontWeight.w400);
  static final greenDarkBoldS15 = greenDark.copyWith(fontSize: 15, fontWeight: FontWeight.w600);
  static final greenDarkLightS15 = greenDark.copyWith(fontSize: 15, fontWeight: FontWeight.w300);

  // ocean Blue
  static final oceanBlue = TextStyle(color: AppColors.oceanBlueText, fontWeight: FontWeight.w600);

  // s24
  static final oceanBlueS24 = oceanBlue.copyWith(fontSize: 24);
  static final oceanBlueS24Bold = oceanBlue.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  static final oceanBlueS24Medium = oceanBlue.copyWith(fontSize: 24, fontWeight: FontWeight.w400);
  static final oceanBlueS24Light = oceanBlue.copyWith(fontSize: 24, fontWeight: FontWeight.w300);
  // s20
  static final oceanBlueS20 = oceanBlue.copyWith(fontSize: 20);
  static final oceanBlueS20Bold = oceanBlue.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  static final oceanBlueS20Medium = oceanBlue.copyWith(fontSize: 20, fontWeight: FontWeight.w400);
  static final oceanBlueS20Light = oceanBlue.copyWith(fontSize: 20, fontWeight: FontWeight.w300);

  // s12
  static final oceanBlueS12 = oceanBlue.copyWith(fontSize: 12);
  static final oceanBlueS12Bold = oceanBlue.copyWith(fontSize: 12, fontWeight: FontWeight.w600);
  static final oceanBlueS12Medium = oceanBlue.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
  // s14
  static final oceanBlueS14 = oceanBlue.copyWith(fontSize: 14);
  static final oceanBlueS14Bold = oceanBlue.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static final oceanBlueS14Medium = oceanBlue.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static final oceanBlueS14Light = oceanBlue.copyWith(fontSize: 14, fontWeight: FontWeight.w300);

  //s15
  static final oceanBlueS15 = oceanBlue.copyWith(fontSize: 15);
  static final oceanBlueS15Bold = oceanBlue.copyWith(fontSize: 15, fontWeight: FontWeight.w600);
  static final oceanBlueS15Medium = oceanBlue.copyWith(fontSize: 15, fontWeight: FontWeight.w400);
  static final oceanBlueS15Light = oceanBlue.copyWith(fontSize: 15, fontWeight: FontWeight.w300);

  //  /s13
  static final oceanBlueS13 = oceanBlue.copyWith(fontSize: 13);
  static final oceanBlueS13Bold = oceanBlue.copyWith(fontSize: 13, fontWeight: FontWeight.w600);
  static final oceanBlueS13Medium = oceanBlue.copyWith(fontSize: 13, fontWeight: FontWeight.w400);
  static final oceanBlueS13Light = oceanBlue.copyWith(fontSize: 13, fontWeight: FontWeight.w300);

  // green text
  static final green = TextStyle(color: AppColors.greenText, fontWeight: FontWeight.w600);

  // s12
  static final greenS12 = green.copyWith(fontSize: 12);
  static final greenS12Bold = green.copyWith(fontSize: 12, fontWeight: FontWeight.w600);
  static final greenS12Medium = green.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
  static final greenS12Light = green.copyWith(fontSize: 12, fontWeight: FontWeight.w300);

  // s13
  static final greenS13 = green.copyWith(fontSize: 13);
  static final greenS13Bold = green.copyWith(fontSize: 13, fontWeight: FontWeight.w600);
  static final greenS13Medium = green.copyWith(fontSize: 13, fontWeight: FontWeight.w400);
  static final greenS13Light = green.copyWith(fontSize: 13, fontWeight: FontWeight.w300);

  // s14
  static final greenS14 = green.copyWith(fontSize: 14);
  static final greenS14Bold = green.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static final greenS14Medium = green.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static final greenS14Light = green.copyWith(fontSize: 14, fontWeight: FontWeight.w300);

  // s15
  static final greenS15 = green.copyWith(fontSize: 15);
  static final greenS15Bold = green.copyWith(fontSize: 15, fontWeight: FontWeight.w600);
  static final greenS15Medium = green.copyWith(fontSize: 15, fontWeight: FontWeight.w400);
  static final greenS15Light = green.copyWith(fontSize: 15, fontWeight: FontWeight.w300);

  // s20
  static final greenS20 = green.copyWith(fontSize: 20);
  static final greenS20Bold = green.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  static final greenS20Medium = green.copyWith(fontSize: 20, fontWeight: FontWeight.w400);
  static final greenS20Light = green.copyWith(fontSize: 20, fontWeight: FontWeight.w300);
}
