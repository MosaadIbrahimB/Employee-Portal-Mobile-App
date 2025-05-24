import 'package:employee_portal_mobile_app/core/utils/app_message.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class HeaderAllSkillWidget extends StatelessWidget {
  const HeaderAllSkillWidget({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.sizeOf(context).height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.iBMP16w400),
          GestureDetector(
            onTap: (){
              AppMessage.msgFunction(context);

            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("الترتيب حسب", style: AppTextStyle.iBMP12w700Black),
                SizedBox(height: 10.w),
                Stack(
                  children: [
                    Icon(Icons.keyboard_arrow_up_rounded),
                    Positioned(
                      bottom: -11.h,
                      child: Icon(Icons.keyboard_arrow_down_rounded),
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
