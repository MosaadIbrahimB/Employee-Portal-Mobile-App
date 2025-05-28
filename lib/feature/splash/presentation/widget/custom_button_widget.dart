import 'package:employee_portal_mobile_app/core/utils/app_text_style.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.borderColor,
    this.colorTitle,
  });

  final void Function() onTap;
  final String title;
  final Color? color;
  final Color? borderColor;
  final Color? colorTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        // width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? AppColor.primary,
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(
            color:borderColor!=null? borderColor! : Colors.transparent,
                      )
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyle.iBMP14w600Whit.copyWith(color: colorTitle),
              ),
              SizedBox(width: 8.w),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.primary
                    )
                  ),
                  child: Icon(Icons.add,color: AppColor.primary,))
            ],
          ),
        ),
      ),
    );
  }
}
