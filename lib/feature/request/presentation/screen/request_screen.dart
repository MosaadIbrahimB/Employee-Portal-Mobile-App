import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/custom_elevated_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_skill/header_all_skill_widget.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Text("الطلبات", style: AppTextStyle.iBMP24w600),
            SizedBox(height: 34.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10).r,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE5E5E5)),
                borderRadius: BorderRadius.circular(8).r,
                color: Colors.white,
              ),
              child: HeaderAllSkillWidget(
                title: "قائمة الطلبات",
                subTitle: "حالة الطلبات | الكل",
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              height: 215.h,
              padding: EdgeInsets.symmetric(horizontal: 10).r,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE5E5E5)),
                borderRadius: BorderRadius.circular(8).r,
                color: Colors.white,
              ),
              child: Center(
                child: SizedBox(
                  width: 257.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "لا يوجد اي طلبات",
                        style: AppTextStyle.iBMP24w600Black.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "يتم اخد اجازة لاسباب صحية او اضطرارية ",
                        style: AppTextStyle.iBMP16w500Black,
                      ),
                      Text("فقط", style: AppTextStyle.iBMP16w500Black),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 48.h,
                        child: CustomElevatedButtonWidget(
                          data: "طلب جديد",
                          icon: Icons.keyboard_arrow_down,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
