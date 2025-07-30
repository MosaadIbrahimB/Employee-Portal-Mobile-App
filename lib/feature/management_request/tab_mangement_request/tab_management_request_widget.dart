import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_tab_of_app_bar_switcher.dart';

import '../../request/presentation/control/request/request_cubit.dart';
import '../app_bar_management_request_widget.dart';
import 'body_tab_management_request_widget.dart';

class TabManagementRequestWidget extends StatelessWidget {
  const TabManagementRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        AppBarManagementRequestWidget(
          icon: Icons.close,
          title: "طلباتى الادارية",
          onTap: () {
            context.read<RequestCubit>().changePage(0);
          },
        ),
        SizedBox(height: 12.h),
        RequestTabOfAppBarSwitcher(),
        SizedBox(height: 12.h),
        BodyTabManagementRequestWidget(),
      ],
    );
  }
}
