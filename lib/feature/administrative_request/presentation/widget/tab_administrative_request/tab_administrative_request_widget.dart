import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import '../app_bar_management_request_widget.dart';
import 'body_tab_administrative_request_widget.dart';
class TabAdministrativeRequestWidget extends StatelessWidget {
  const TabAdministrativeRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        AppBarAdministrativeRequestWidget(
          icon: Icons.close,
          title: "طلباتى الادارية",
          onTap: () {
            context.read<RequestCubit>().changePage(0);
            context.read<TabSwitcherCubit>().changeTab(0);
          },
        ),
        SizedBox(height: 12.h),
        RequestTabOfAppBarSwitcher(tabs: ['طلب ادارى', 'الاعتمادات الادارية'],),
        SizedBox(height: 12.h),
        BodyTabAdministrativeRequestWidget(),
      ],
    );
  }
}
