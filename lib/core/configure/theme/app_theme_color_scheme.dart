import 'package:employee_portal_mobile_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
class AppThemeColorScheme{

  static ColorScheme lightColorScheme ()=> ColorScheme(
    brightness: Brightness.light,

    primary: AppColor.primary,
    onPrimary: Colors.white,

    secondary: Colors.cyan,
    onSecondary: AppColor.darkGreen,

    error: AppColor.red,
    onError: AppColor.darkRed,

    surface: AppColor.goldTransparent,
    onSurface: AppColor.orange,

    outline: AppColor.lightGray,
    background: AppColor.darkGray,
    shadow: AppColor.gray

  );
}