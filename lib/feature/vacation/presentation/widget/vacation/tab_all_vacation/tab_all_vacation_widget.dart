import 'package:employee_portal_mobile_app/core/component/header_core_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/layout/export_Layout_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_vacation_of_app_bar_switcher.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/vacation_report_widget.dart';

class TabAllVacationWidget extends StatelessWidget {
  TabAllVacationWidget({super.key});

  final List<ReportModel> reportModel = [
    ReportModel(
      nameReport: "اجازة مرضية",
      isUnderReview: true,
      numberOfInstallments: 3,
      isSickLeave: true,
      amount: 234,
    ),
    ReportModel(
      nameReport: "اجازة حج",
      isUnderReview: true,
      numberOfInstallments: 3,
      isSickLeave: true,
      amount: 234,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCoreWidget(title: "جميع الاجازات", subTitle: "الترتيب حسب"),
        SizedBox(height: 12.h),
        Column(
          children:
              reportModel
                  .map((e) => VacationReportWidget(reportModel: e))
                  .toList(),
        ),

      ],
    );
  }
}




