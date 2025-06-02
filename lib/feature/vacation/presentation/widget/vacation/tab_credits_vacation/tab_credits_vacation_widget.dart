import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/opening_time_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/control/request/request_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/AppBarTabManagementRequestWidget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/date_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/tab_credits_management_request/item_of_tab_credits_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/control/vacation_tab/vacation_tab_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/item_of_from_to_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
class ItemOfTabCreditsVacationWidget extends StatelessWidget {
  const ItemOfTabCreditsVacationWidget({
    super.key,
    required this.reportModel,
  });

  final ReportModel reportModel;
  static const IconData moreH = IconData(0xe402, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReportStatusWidget(
                reportModel: reportModel,
              ),
              Icon(moreH)
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("اسم الموظف  : محمد فتحى محمد غانم"),
              Text("مصمم تجربة مستخدم"),
            ],
          ),
          SizedBox(height: 12.h),
          OpeningTimeWidget(title: "المدة : 10 أيام",color: context.color.shadow,),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ItemOfFromToWidget(
                  title: "من",
                  date: "22 نوفمبر2024",
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: ItemOfFromToWidget(
                  title: "من",
                  date: "22 نوفمبر2024",
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
