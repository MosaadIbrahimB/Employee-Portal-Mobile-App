import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_tab_of_app_bar_switcher.dart';

import '../../../core/service/dependency_injection/depend_inject.dart';
import '../../request/presentation/control/admin_request_type/get_admin_request_type_cubit.dart';
import '../../request/presentation/control/request/request_cubit.dart';
import '../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../app_bar_financial_request_widget.dart';
import 'body_tab_financial_request_widget.dart';

class TabFinancialRequestWidget extends StatelessWidget {
  const TabFinancialRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        AppBarFinancialRequestWidget(
          icon: Icons.close,
          title: "طلباتى المالية",
          onTap: () {
            context.read<RequestCubit>().changePage(0);
            context.read<TabSwitcherCubit>().changeTab(0);
          },
        ),
        SizedBox(height: 12.h),
        RequestTabOfAppBarSwitcher(tabs: ['طلب مالى', 'الاعتمادات المالية'],),
        SizedBox(height: 12.h),
        BodyTabFinancialRequestWidget(),
      ],
    );
  }
}
