import 'package:employee_portal_mobile_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
class AppThemeColorScheme{

  static ColorScheme lightColorScheme ()=> ColorScheme(
    brightness: Brightness.light,

    primary: AppColor.primary,
    onPrimary: AppColor.oceanBlue,

    secondary: AppColor.cloudMist,
    onSecondary: AppColor.darkGreen,

    error: AppColor.red,
    onError: AppColor.darkRed,

    surface: AppColor.goldTransparent,
    onSurface: AppColor.orange,

    outline: AppColor.softStone,
    background: AppColor.snowWhite,
    shadow: AppColor.gray,

      onPrimaryFixed: AppColor.lightBlueBg,
      onSecondaryFixed: AppColor.white
  );
}