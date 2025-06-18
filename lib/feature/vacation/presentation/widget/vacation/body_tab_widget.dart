import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_tab/vacation_tab_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_all_vacation/tab_all_vacation_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_credits_vacation/tab_credits_vacation_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_vacation_of_app_bar_switcher.dart';

import '../../control/vacation_cubit/vacation_cubit.dart';

class BodyTabWidget extends StatelessWidget {
  const BodyTabWidget({super.key});

  static final List<Widget> body = [
    TabAllVacationWidget(),
    TabCreditsVacationWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VacationTabCubit, int>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  TabVacationOfAppBarSwitcherWidget(),
                  SizedBox(height: 16.h),
                  body[state],
                  SizedBox(height: 60.h),

                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: GestureDetector(
                      onTap: (){
                        // context.read<RequestCubit>().changePage(1);
                        // context.read<TabSwitcherCubit>().changeTab(0);
                        context.read<VacationCubit>().changeTab(1);

                      },
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    )
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
