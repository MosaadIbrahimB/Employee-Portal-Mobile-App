import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/control/tab_person_screen_cubit/tab_cubit.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_education/education_data_widget.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_of_app_bar_switcher.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_skill/skill_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/info_data_widget.dart';

class PersonScreen extends StatelessWidget {
const  PersonScreen({super.key});

 static final  List<Widget> listBody = [
    InfoDataWidget(),
    SkillDataWidget(),
   EducationDataWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الملف الشخصي', style: context.text.displayMedium,),//AppTextStyle.iBMP24w600),
              TabOfAppBarSwitcher(),
            ],
          ),
        ),
        body: BlocBuilder<TabCubit, int>(
          builder: (context, state) {
            return listBody[state];
          },
        ),
      ),
    );
  }
}

