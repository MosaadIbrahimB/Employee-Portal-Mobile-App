import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/app_message.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class HeaderCoreWidget extends StatelessWidget {
  const HeaderCoreWidget({super.key, required this.title, required this.subTitle});
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.sizeOf(context).height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style:context.text.titleMedium!.copyWith(
            color: context.color.onSurface,
            fontWeight: FontWeight.w400,
          )),
          GestureDetector(
            onTap: (){
              AppMessage.msgFunction(context);

            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(subTitle, style:
                context.text.labelMedium!.copyWith(
                  color:AppColor. black64A,
                  fontWeight: FontWeight.w700,
                )),

                SizedBox(height: 10.w),
                Stack(
                  children: [
                    Icon(Icons.keyboard_arrow_up_rounded,color: AppColor.black64A,),
                    Positioned(
                      bottom: -11.h,
                      child: Icon(Icons.keyboard_arrow_down_rounded,color: AppColor.black64A,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
