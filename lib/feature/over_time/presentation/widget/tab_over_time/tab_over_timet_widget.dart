import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/over_time/presentation/control/get_employee_over_time/get_employee_over_time_cubit.dart';
import 'package:employee_portal_mobile_app/feature/over_time/presentation/widget/tab_of_app_bar_switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../person/presentation/widget/tab_of_app_bar_switcher.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import 'body_tab_over_time_widget.dart';

class TabOverTimeWidget extends StatelessWidget {
  const TabOverTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocProvider(
      create:
          (context) =>
      sl<GetEmployeeOverTimeCubit>()..getEmployeeOverTime(),
      child: Column(
          children: [
            SizedBox(height: 12.h),
            AppBarRequestWidget(
              icon: Icons.close,
              title: "طلباتى للاضافى",
              onTap: () {
                context.read<RequestCubit>().changePage(0);
                context.read<TabSwitcherCubit>().changeTab(0);
              },
            ),
            SizedBox(height: 12.h),
            TabOfAppBarSwitcherWidget(
              tabs: ['اضافة طلب اضافى', 'طلباتى للاضافى','اعتمادات الاضافى']),
            SizedBox(height: 12.h),
            BodyTabOverTimeWidget(),
          ]
      ),
    );
  }
}
