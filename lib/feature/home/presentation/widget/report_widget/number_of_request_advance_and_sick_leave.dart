import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/request_advance_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/sick_leave_widget.dart';

class NumberOfRequestAdvanceAndSickLeave extends StatelessWidget {
  const NumberOfRequestAdvanceAndSickLeave({
    super.key,
    required this.reportModel,
  });

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8).r,
      decoration: BoxDecoration(
        color:
            reportModel.isSickLeave == true
                ? context.color.onPrimaryFixed
                : null,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (reportModel.isRequestAdvance == true)
                RequestAdvanceWidget(reportModel: reportModel),
              if (reportModel.isSickLeave == true)
                SickLeaveWidget(reportModel: reportModel),
            ],
          ),
        ],
      ),
    );
  }
}
