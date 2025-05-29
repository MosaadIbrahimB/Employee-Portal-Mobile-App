import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/header_home_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/last_salary_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderHomeWidget(title: "اسلام هاني"),
        Column(
          children:
          ReportModel.listReport
              .map((e) => ReportWidget(reportModel: e))
              .toList(),
        ),
        SizedBox(height: 20),
        LastSalaryWidget(),
      ],
    );
  }
}
