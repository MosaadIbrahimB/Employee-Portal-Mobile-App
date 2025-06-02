import 'package:employee_portal_mobile_app/core/component/custom_elevated_button_widget.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/money/widget/tab_all_money/money_item_request_widget.dart';

import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/AppBarTabManagementRequestWidget.dart';


class MoneyAllRequestWidget extends StatelessWidget {
  const MoneyAllRequestWidget({super.key});
  static final List<ReportModel> listItem = [
    ReportModel(
      isCertified: true,
      typeReport: "استقالة",
      amount: 400,
      dateRequest: "30 ديسمبر 2023",
    ),
    ReportModel(
      isUnderReview: true,
      typeReport: "نقل",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
    ReportModel(
      isRejected: true,
      typeReport: "ترقية",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        AppBarTabManagementRequestWidget(),
        SizedBox(height: 16.h),
        Column(
          children:
          listItem
              .map((e) => MoneyItemRequestWidget(reportModel: e))
              .toList(),
        ),
        SizedBox(height: 25.h,),
        CustomElevatedButtonWidget(
          data: "طلب ادارى",
        )
      ],
    );
  }
}
