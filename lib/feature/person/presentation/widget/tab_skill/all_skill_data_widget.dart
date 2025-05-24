import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:employee_portal_mobile_app/feature/person/data/skill_model.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/custom_elevated_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_skill/header_all_skill_widget.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_skill/item_skill_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllSkillDataWidget extends StatelessWidget {
  const AllSkillDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderAllSkillWidget(title: "جميع المهارات",),
        SizedBox(height: 16.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: EducationAndSkillModel.listSkill.length,
          itemBuilder: (context, index) {
            return ItemSkillWidget(skillModel: EducationAndSkillModel.listSkill[index]);
          },
        ),

        CustomElevatedButtonWidget(
          icon: Icons.add,
          data: "أضف",
          onPressed: () {
            BlocProvider.of<SkillPageCubit>(context).changePage(1);
          },
        ),
      ],
    );
  }
}





