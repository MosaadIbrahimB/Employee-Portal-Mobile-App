import 'package:employee_portal_mobile_app/core/utils/app_text_style.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoReportWidget extends StatelessWidget {
  const NoReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50).r,
      child: SizedBox(
          height: 356.h,
          child: Column(
            children: [
              SizedBox(height: 66.h),
              SvgPicture.asset("assets/image/home/no_report.svg"),
              SizedBox(height: 25.h),
              Text("لا يوجد تقارير", style: AppTextStyle.iBMP24w600Black),
              SizedBox(height: 12.h),
              Text("هل بك في نظام مهر لادارة الموارد البشرية", style: AppTextStyle.iBMP16w500Black)
            ],
          )),
    );
  }
}
