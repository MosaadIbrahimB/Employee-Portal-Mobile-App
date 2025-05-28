import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/date_request_widget.dart';

class ItemRequestWidget extends StatelessWidget {
  const ItemRequestWidget({
    super.key,
    required this.reportModel,
  });

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: Colors.black12, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // معتمده - تحت الطلب -مرفوض - التاريخ
          ReportStatusWidget(
            reportModel: reportModel,
          ),
          SizedBox(height: 8.h),
          DateRequestWidget(reportModel: reportModel,),

        ],
      ),
    );
  }
}
