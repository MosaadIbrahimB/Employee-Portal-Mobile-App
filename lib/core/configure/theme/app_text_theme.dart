import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class AppTextTheme {
  static TextTheme? textTheme() {
    return TextTheme(
      displayLarge: AppTextStyle.iBMP38w700,
      displayMedium: AppTextStyle.iBMP24w600,
      displaySmall: AppTextStyle.iBMP20w600,

      headlineLarge: AppTextStyle.iBMP24w500,
      headlineMedium: AppTextStyle.iBMP18w700,
      headlineSmall: AppTextStyle.iBMP16w700Black,

      titleLarge: AppTextStyle.iBMP16w700Black,
      titleSmall: AppTextStyle.iBMP14w400,


      bodyLarge: AppTextStyle.iBMP14w700,
      // نص أساسي كبير
      bodyMedium: AppTextStyle.iBMP14w500,
      // نص أساسي متوسط
      bodySmall: AppTextStyle.iBMP12w500,

      // نص ثانوي
      labelLarge: AppTextStyle.iBMP14w600Whit,
      // أزرار أو عناصر بارزة
      labelMedium: AppTextStyle.iBMP12w500Green,
      // تصنيفات أو شارات
      labelSmall: AppTextStyle.iBMP10w700, // نصوص صغيرة جدًا
    );
  }
}
