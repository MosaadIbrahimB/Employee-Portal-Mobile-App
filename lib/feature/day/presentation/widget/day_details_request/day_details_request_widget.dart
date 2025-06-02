import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/day/presentation/widget/day_app_bar_widget.dart';

import '../../../../../generated/assets.dart';
import '../../../../home/data/report_model.dart';
import '../../../../request/data/model/account_model.dart';
import '../../../../request/presentation/widget/add_request/add_document_button_widget.dart';
import '../../../../request/presentation/widget/request_type/management_request/details_management_request/account_widget.dart';
import '../../../../request/presentation/widget/request_type/management_request/details_management_request/app_bar_details_item_request_widget.dart';
import '../../../../request/presentation/widget/request_type/management_request/details_management_request/nots_details_widget.dart';
import '../../../../request/presentation/widget/request_type/management_request/details_management_request/submission_date_widget.dart';
import '../../../../request/presentation/widget/request_type/management_request/details_management_request/time_widget.dart';
import '../../../../request/presentation/widget/request_type/management_request/details_management_request/type_widget.dart';

class DayDetailsRequestWidget extends StatelessWidget {
  const DayDetailsRequestWidget({super.key});
  static final List<ReportModel> listItem = [
    ReportModel(
      isCertified: true,
      typeReport: "عدد ساعات العمل أكبر من الحد الأقصى",
      amount: 400,
      dateRequest: "30 ديسمبر 2023",
    ),
    ReportModel(
      isUnderReview: true,
      typeReport: "إنصراف متأخر",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
    ReportModel(
      isRejected: true,
      typeReport: "حضور مبكر",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
    ReportModel(
      isRejected: true,
      typeReport: "حضور مبكر",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
    ReportModel(
      isUnderReview: true,
      typeReport: "إنصراف متأخر",
      amount: 260,
      dateRequest: "5 ديسمبر 2023",
    ),
  ];
  static final ReportModel reportModel= ReportModel(

    isCertified: true,
    typeReport: "عدد ساعات العمل أكبر من الحد الأقصى",
    amount: 400,
    dateRequest: "30 ديسمبر 2023",
    appBarTitle: "تفاصيل الطلب"
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: DayAppBarWidget(title: "تفاصيل الطلب"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0).r,
            child: Column(
              children: [
                SizedBox(height: 16.h),
                // معتمده - تحت الطلب -مرفوض
                AppBarDetailsItemRequestWidget(reportModel: reportModel),
                SizedBox(height: 16.h),
                //   التاريخ
                SubmissionDateWidget(reportModel: reportModel),
                SizedBox(height: 16.h),
                //النوع
                TypeWidget(reportModel: reportModel),
                SizedBox(height: 16.h),
                TimeWidget(reportModel: reportModel),
                //المراجع الاول الثانى
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  AccountModel.accountList
                      .map((e) => AccountWidget(accountModel: e))
                      .toList(),
                ),
                SizedBox(height: 16.h),
                AddDocumentButtonWidget(
                  onTap: (){},
                  title: "الوثائق",
                  widget: SizedBox(
                    width: 20.w,
                    height: 25.h,
                    child: Image.asset(Assets.requestPdf),
                  ),
                ),
                SizedBox(height: 16.h),
                NotsDetailsWidget(reportModel: reportModel,),
                SizedBox(height: 16.h),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
