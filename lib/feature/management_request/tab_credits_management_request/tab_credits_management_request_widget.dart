import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../request/presentation/control/request/request_cubit.dart';
import '../AppBarTabManagementRequestWidget.dart';
import '../app_bar_management_request_widget.dart';
import 'item_of_tab_credits_request_widget.dart';


class TabCreditsManagementRequestWidget extends StatelessWidget {
  const TabCreditsManagementRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        AppBarManagementRequestWidget(title: "ادارى قيد الاعتماد",
            onTap:    (){
              context.read<RequestCubit>().changePage(0);
            }
        ),
        SizedBox(height: 12.h),
        RequestTabOfAppBarSwitcher(),
        SizedBox(height: 12.h),
        AppBarTabManagementRequestWidget(),
        SizedBox(height: 12.h),
        Column(
          children:
          ReportModel.listManagement
              .map((e) => ItemOfTabCreditsRequestWidget(reportModel: e))
              .toList(),
        ),

      ],
    );
  }
}
