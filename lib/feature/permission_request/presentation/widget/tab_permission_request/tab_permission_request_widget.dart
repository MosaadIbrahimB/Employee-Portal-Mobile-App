import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import 'body_tab_permission_request_widget.dart';

class TabPerMissionRequestWidget extends StatelessWidget {
  const TabPerMissionRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        AppBarRequestWidget(
          icon: Icons.close,
          title: "اذوناتى",
          onTap: () {
            context.read<RequestCubit>().changePage(0);
            context.read<TabSwitcherCubit>().changeTab(0);
          },
        ),
        SizedBox(height: 12.h),
        RequestTabOfAppBarSwitcher(tabs: ['طلب اذن', 'اعتماد الاذونات'],),
        SizedBox(height: 12.h),
        BodyTabPerMissionRequestWidget(),
      ]
    );
  }
}
