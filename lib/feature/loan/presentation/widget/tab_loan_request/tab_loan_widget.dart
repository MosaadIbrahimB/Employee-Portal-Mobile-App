import 'package:employee_portal_mobile_app/feature/loan/presentation/control/get_employee_loan/get_employee_loan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';
import '../../../../request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import 'body_loan_widget.dart';

class TabLoanWidget extends StatelessWidget {
  const TabLoanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocProvider(
      create:
          (context) =>
      sl<GetEmployeeLoanCubit>()..getEmployeeLoan(),
      child: Column(
          children: [
            SizedBox(height: 12.h),
            AppBarRequestWidget(
              icon: Icons.close,
              title: "سلفى",
              onTap: () {
                context.read<RequestCubit>().changePage(0);
                context.read<TabSwitcherCubit>().changeTab(0);
              },
            ),
            SizedBox(height: 12.h),
            RequestTabOfAppBarSwitcher(
              tabs: ['طلب سلفة', 'اعتماد السلف'],),
            SizedBox(height: 12.h),
            BodyLoanWidget(),
          ]
      ),
    );
  }
}
