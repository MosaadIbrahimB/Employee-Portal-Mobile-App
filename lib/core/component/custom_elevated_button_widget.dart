import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key, this.onPressed, required this.data, this.icon,
  });
  final void Function()? onPressed;
  final String data;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
       onTap: onPressed,
        child: Container(
          height: 50.h,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            color:context.color.primary,// AppColor.primary,

          ),
          child:Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data,
                style:context.text.bodyLarge!.copyWith(color: context.color.surface),
              ),
              SizedBox(width: 8.w),
              Icon(icon, color: context.color.surface),
            ],
          ) ,
        ),
      );

  }
}
