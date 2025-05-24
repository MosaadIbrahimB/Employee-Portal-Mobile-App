import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/header_home_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/last_salary_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/no_report_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderHomeWidget(title: "اسلام هاني"),
              // NoReportWidget(),
              ReportWidget(
                typeReport: "تقرير الطلبات",
                nameReport: "طلب سلفة",
                isRequestAdvance: true,
                isCertified: true,
                numberOfInstallments: 3,
                amount: 234,
                not: "تقبل الله منكم الحج وقد تم اعتماد الاجازة",
              ),
              ReportWidget(
                typeReport: "تقرير الاجازات",
                nameReport: "اجازة مرضية",
                isUnderReview: true,
                isSickLeave: true,
                numberOfInstallments: 2,
                amount: 20,
              ),
              SizedBox(height: 20),
              LastSalaryWidget()
            ],
          ),
        ),
      ),
    );
  }
}

