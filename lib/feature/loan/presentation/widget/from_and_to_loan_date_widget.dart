import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class FromAndToLoanDateWidget extends StatelessWidget {
  const FromAndToLoanDateWidget({super.key, this.title, this.date});
  final String? title;
  final String? date;
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
          Text(
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
        ],
      ),
    );
  }
}
