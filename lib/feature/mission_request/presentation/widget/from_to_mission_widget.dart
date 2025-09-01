import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class FromToMissionWidget extends StatelessWidget {
  const FromToMissionWidget({super.key, this.title, this.date, this.time});
  final String? title;
  final String? date;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: AppColor.black12, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          title == null
              ? SizedBox()
              : Text(
                title ?? "من",
                style: context.text.titleSmall,
              ), // Color(0xff3D4966)),
          SizedBox(height: 8.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_today_outlined, size: 16.r),
              SizedBox(width: 8.w),
              Text(
                date != null
                    ? date!.substring(0, 10)
                    : "تاريخ تقديم الطلب  :غير متاح",

                style: context.text.titleSmall, // Color(0xff3D4966)
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                size: 15,
                color: AppColor.midnightBlue,
              ),
              SizedBox(width: 8.w),
              Text(time ?? "9:00 صباحاً", style: context.text.titleSmall),
            ],
          ), // Color(0xff3D4966)),
        ],
      ),
    );
  }
}
