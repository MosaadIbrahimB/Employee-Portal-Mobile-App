import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class AppTextTheme {
  static TextTheme? textTheme() {
    return TextTheme(
      displayLarge: AppTextStyle.iBMP38w700,
      displayMedium: AppTextStyle.iBMP24w600,
      displaySmall: AppTextStyle.iBMP20w600,

      headlineLarge: AppTextStyle.iBMP24w500,
      headlineMedium: AppTextStyle.iBMP18w700,

      titleLarge: AppTextStyle.iBMP16w700Black,
      titleMedium: AppTextStyle.iBMP16w500Black,
      titleSmall: AppTextStyle.iBMP14w400,


      bodyLarge: AppTextStyle.iBMP14w700,
      bodyMedium: AppTextStyle.iBMP14w500,
      bodySmall: AppTextStyle.iBMP12w500,

      labelLarge: AppTextStyle.iBMP14w600Whit,
      labelMedium: AppTextStyle.iBMP12w500Green,
      labelSmall: AppTextStyle.iBMP10w700, // نصوص صغيرة جدًا
    );
  }
}
