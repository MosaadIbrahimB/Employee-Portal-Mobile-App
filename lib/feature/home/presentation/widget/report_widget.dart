import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/header_report_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/number_of_request_advance_and_sick_leave.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/opening_time_widget.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({
    super.key,
  required this.reportModel,
  });

  final ReportModel reportModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //نوع الطلب
     HeaderReportWidget(typeReport:reportModel.typeReport),
        SizedBox(height: 12.h),
        Container(
          // height: 150.h,
          padding: EdgeInsets.all(12).r,
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color:AppColor.black12, width: 1.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // معتمده - تحت الطلب -مرفوض - التاريخ
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReportStatusWidget(
                  reportModel: reportModel,
                  ),
                  OpeningTimeWidget(),
                ],
              ),
              SizedBox(height: 12.h),
              //عدد الاقساط -- مسحوبات الرصيد
              reportModel.isRejected==true?SizedBox.shrink():
              NumberOfRequestAdvanceAndSickLeave(reportModel: reportModel,),
              SizedBox(height: 12.h),
              Text("ملاحظات",
                  style:context.text.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,

              ) ),
              SizedBox(height: 6.h),
              Text(
                reportModel.not??"لا يوجد ملاحظات مضافة ",
                style:context.text.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


