import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import '../../control/get_employee_mission/get_employee_mission_cubit.dart';
import 'body_tab_mission_request_widget.dart';

class TabMissionRequestWidget extends StatelessWidget {
  const TabMissionRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocProvider(
      create:
          (context) =>
      sl<GetEmployeeMissionCubit>()..getEmployeeMission(),
      child: Column(
          children: [
            SizedBox(height: 12.h),
            AppBarRequestWidget(
              icon: Icons.close,
              title: "مأمورياتى",
              onTap: () {
                context.read<RequestCubit>().changePage(0);
                context.read<TabSwitcherCubit>().changeTab(0);
              },
            ),
            SizedBox(height: 12.h),
            RequestTabOfAppBarSwitcher(
              tabs: ['طلب مأمورية', 'اعتماد المأموريات'],),
            SizedBox(height: 12.h),
            BodyTabMissionRequestWidget(),
          ]
      ),
    );
  }
}
