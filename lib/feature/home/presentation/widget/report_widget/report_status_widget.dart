import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';

class ReportStatusWidget extends StatelessWidget {
  const ReportStatusWidget({
    super.key, required this.reportModel,

  });


final ReportModel reportModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        reportModel.  isCertified == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: Color.fromRGBO(49, 200, 89, .15),
          ),
          child: Text("معتمدة", style: AppTextStyle.iBMP12w500Green),
        )
            : SizedBox(),
        //قيد التدقيق
        reportModel. isUnderReview == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 215, 5, 0.1),
          ),
          child: Text("قيد التدقيق", style: AppTextStyle.iBMP12w500Orange),
        )
            : SizedBox(),
        reportModel. isRejected == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 120, 117, 0.24),
          ),
          child: Text("مرفوض", style: AppTextStyle.iBMP12w500Red),
        )
            : SizedBox(),
        SizedBox(width: 3.w),
        Text(reportModel.nameReport ?? "", style: AppTextStyle.iBMP20w600),
      ],
    );
  }
}
