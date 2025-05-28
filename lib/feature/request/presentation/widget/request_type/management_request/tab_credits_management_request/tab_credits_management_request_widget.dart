import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/AppBarTabManagementRequestWidget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/date_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/tab_credits_management_request/item_of_tab_credits_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/widget/custom_button_widget.dart';

class TabCreditsManagementRequestWidget extends StatelessWidget {
  const TabCreditsManagementRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarTabManagementRequestWidget(),
        SizedBox(height: 12.h),
        Column(
          children:
          ReportModel.listManagement
              .map((e) => ItemOfTabCreditsRequestWidget(reportModel: e))
              .toList(),
        ),
        // SizedBox(height: 21.h),
        // CustomButtonWidget(onTap: (){}, title: "طلب ادارى")

      ],
    );
  }
}
