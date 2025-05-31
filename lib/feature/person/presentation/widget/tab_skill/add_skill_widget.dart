import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:employee_portal_mobile_app/core/component/custom_elevated_button_widget.dart';
import 'package:employee_portal_mobile_app/core/component/input_date_day_widget.dart';
import 'package:employee_portal_mobile_app/core/component/input_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSkillWidget extends StatelessWidget {
  AddSkillWidget({super.key});

 final TextEditingController skillController = TextEditingController();
 final TextEditingController degreeSkillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<SkillPageCubit>(context).changePage(0);
              },
              child: Container(
                padding: EdgeInsets.all(8).r,
                color: context.color.secondary,//Color(0xffF2F5F9),
                child: Icon(Icons.close),
              ),
            ),
            SizedBox(width: 12.w),
            Text("اضافة مهارة جديدة", style:context.text.displayMedium
                ,)//AppTextStyle.iBMP24w600),
          ],
        ),
        SizedBox(height: 8.h),
        InputDataWidget(
          title: "المهارة",
          hint: "اختر المهارة",
          controller: skillController,
        ),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: "الدرجة",
          hint: "اختر المهارة",
          controller: degreeSkillController,
        ),
        SizedBox(height: 16.h),
        InputDateDayWidget(
          data: "التاريخ",

        ),
        SizedBox(height: 44.h),
        CustomElevatedButtonWidget(data: "حفظ",onPressed: (){
          BlocProvider.of<SkillPageCubit>(context).changePage(0);
        },)
      ],
    );
  }
}

