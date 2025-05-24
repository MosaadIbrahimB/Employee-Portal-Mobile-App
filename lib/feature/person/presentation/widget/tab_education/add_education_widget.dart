import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/control/education_page/education_cubit.dart';
import 'package:employee_portal_mobile_app/feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/custom_elevated_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_info_data/input_birth_day_widget.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_skill/input_skill_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEducationWidget extends StatelessWidget {
  AddEducationWidget({super.key});

 final TextEditingController nameUnvController = TextEditingController();
 final TextEditingController filedEduController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<EducationPageCubit>(context).changePage(0);
              },
              child: Container(
                padding: EdgeInsets.all(8).r,
                color: Color(0xffF2F5F9),
                child: Icon(Icons.close),
              ),
            ),
            SizedBox(width: 12.w),
            Text("اضافة درجة علمية", style: AppTextStyle.iBMP24w600),
          ],
        ),
        SizedBox(height: 8.h),
        InputSkillDataWidget(
          title: "جامعة/معهد",
          hint: "اكتب اسم الجامعة/ المعهد",
          controller: nameUnvController,
        ),
        SizedBox(height: 16.h),
        InputSkillDataWidget(
          title: "التخصص",
          hint: "اكتب اسم التخصص",
          controller: filedEduController,
        ),
        SizedBox(height: 16.h),
        InputBirthDayWidget(
          data: "التاريخ",

        ),
        SizedBox(height: 44.h),
        CustomElevatedButtonWidget(data: "حفظ",onPressed: (){
          BlocProvider.of<EducationPageCubit>(context).changePage(0);
        },)
      ],
    );
  }
}

