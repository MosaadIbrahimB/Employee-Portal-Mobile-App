import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.borderColor,
    this.colorTitle,
    this.isDisableIcon= false,
  });

  final void Function() onTap;
  final String title;
  final Color? color;
  final Color? borderColor;
  final Color? colorTitle;
  final bool? isDisableIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        // width: double.infinity,
        decoration: BoxDecoration(
          color: color ??context.color.primary,// AppColor.primary,
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(
            color: borderColor != null ? borderColor! : Colors.transparent,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: context.text.labelLarge!.copyWith(color: colorTitle),
              ),
              SizedBox(width: 8.w),
              isDisableIcon == true
                  ? SizedBox()
                  : Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primary),
                    ),
                    child: Icon(Icons.add, color: AppColor.primary),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
