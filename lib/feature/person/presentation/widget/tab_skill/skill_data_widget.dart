import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_skill/add_skill_widget.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_skill/all_skill_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SkillDataWidget extends StatelessWidget {
  SkillDataWidget({super.key});

  final List<Widget> page = [
    AllSkillDataWidget(),
    AddSkillWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillPageCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child:BlocBuilder<SkillPageCubit,int>(builder: (context, state) => SingleChildScrollView(
            child: page[state]),),
      ),
    );
  }
}


