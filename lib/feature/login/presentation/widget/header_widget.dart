import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/app_image.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppImage.logo, width: 60.w, height: 73.h),
        SizedBox(height: 26.h),
        Text("مرحبًا بك👋 في تطبيق مهر!",style:
        context.text.displayMedium!.copyWith(
          color: context.color.onSurface,
          fontWeight: FontWeight.w700
        )  ),
        SizedBox(height: 12.h),
        Text("قم بادخال البريد الالكتروني لتتمكن من تسجيل الدخول",
          style: context.text.titleMedium )
      ],
    );
  }
}
