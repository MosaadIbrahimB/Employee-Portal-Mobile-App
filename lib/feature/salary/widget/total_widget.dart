import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({super.key, this.title, this.total, this.isEarnings});

  final String? title;
  final String? total;
  final bool? isEarnings;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
      decoration: BoxDecoration(
        border: Border.all(color: context.color.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'اجمالى $title',
            textAlign: TextAlign.right,
            style: context.text.bodyMedium, // AppTextStyle.iBMP14w500,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isEarnings == true
                          ? AppColor.lightGreen
                          : AppColor.lightRed,
                ),

                child: Icon(
                  isEarnings == true
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                ),
              ),
              SizedBox(width: 8.w),
              Text(total ?? "", style:context.text.titleMedium,)// AppTextStyle.iBMP16w500),
            ],
          ),
        ],
      ),
    );
  }
}
