import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_credits_vacation/item_of_tab_credits_vacation_widget.dart';

class TabCreditsVacationWidget extends StatelessWidget {
  const TabCreditsVacationWidget({super.key});
static final    List<ReportModel> listManagement = [
  ReportModel(
  nameReport: "عارضة",
  isCertified: true,
  dateRequest: " 30 ديسمبر 2023",
  ),
  ReportModel(
  nameReport: "مرضى",
  dateRequest: " 30 ديسمبر 2023",
  isCertified  : true,
  ),
  ReportModel(
  nameReport: "اعتيادى",
  dateRequest: " 30 ديسمبر 2023",
  isRejected: true,
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children:
          ReportModel.listManagement
              .map((e) => ItemOfTabCreditsVacationWidget(reportModel: e))
              .toList(),
        ),

      ],
    );
  }
}
