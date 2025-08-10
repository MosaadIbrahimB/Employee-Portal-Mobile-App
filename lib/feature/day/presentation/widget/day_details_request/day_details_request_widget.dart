// import 'package:employee_portal_mobile_app/core/component/input_data_widget.dart';
// import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
// import 'package:employee_portal_mobile_app/feature/day/presentation/widget/day_app_bar_widget.dart';
// import 'package:employee_portal_mobile_app/feature/day/presentation/widget/work_shift_widget.dart';
//
// import '../../../../../generated/assets.dart';
// import '../../../../home/data/report_model.dart';
// import '../../../../management_request/details_financial_request/app_bar_details_item_request_widget.dart';
// import '../../../../management_request/details_financial_request/submission_date_widget.dart';
// import '../../../../management_request/details_financial_request/type_widget.dart';
// import '../../../../request/data/mission_model/account_model.dart';
// import '../../../../request/presentation/widget/add_document_button_widget.dart';
// import '../../../../request/presentation/widget/request_type/management_request/details_financial_request/reviewer_widget.dart';
// import '../../../../request/presentation/widget/request_type/management_request/details_financial_request/app_bar_details_item_request_widget.dart';
// import '../../../../request/presentation/widget/request_type/management_request/details_financial_request/nots_details_widget.dart';
// import '../../../../request/presentation/widget/request_type/management_request/details_financial_request/submission_date_widget.dart';
// import '../../../../request/presentation/widget/request_type/management_request/details_financial_request/time_widget.dart';
// import '../../../../request/presentation/widget/request_type/management_request/details_financial_request/type_widget.dart';
//
// class DayDetailsRequestWidget extends StatelessWidget {
//   const DayDetailsRequestWidget({super.key});
//   static final List<ReportModel> listItem = [
//     ReportModel(
//       isCertified: true,
//       typeReport: "عدد ساعات العمل أكبر من الحد الأقصى",
//       amount: 400,
//       dateRequest: "30 ديسمبر 2023",
//     ),
//     ReportModel(
//       isUnderReview: true,
//       typeReport: "إنصراف متأخر",
//       amount: 260,
//       dateRequest: "5 ديسمبر 2023",
//     ),
//     ReportModel(
//       isRejected: true,
//       typeReport: "حضور مبكر",
//       amount: 260,
//       dateRequest: "5 ديسمبر 2023",
//     ),
//     ReportModel(
//       isRejected: true,
//       typeReport: "حضور مبكر",
//       amount: 260,
//       dateRequest: "5 ديسمبر 2023",
//     ),
//     ReportModel(
//       isUnderReview: true,
//       typeReport: "إنصراف متأخر",
//       amount: 260,
//       dateRequest: "5 ديسمبر 2023",
//     ),
//   ];
//   static final ReportModel reportModel= ReportModel(
//
//     isCertified: true,
//     typeReport: "عدد ساعات العمل أكبر من الحد الأقصى",
//     amount: 400,
//     dateRequest: "30 ديسمبر 2023",
//     appBarTitle: "تفاصيل الطلب"
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16).r,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 16.h),
//                 // معتمده - تحت الطلب -مرفوض
//                 AppBarDetailsItemRequestWidget(reportModel: reportModel),
//                 SizedBox(height: 16.h),
//                 //   التاريخ
//                 SubmissionDateWidget(reportModel: reportModel),
//                 SizedBox(height: 16.h),
//                 //النوع
//                 TypeWidget(reportModel: reportModel),
//                 SizedBox(height: 16.h),
//                 SubmissionDateWidget(reportModel: reportModel),
//                 SizedBox(height: 16.h),
//                 TimeWidget(reportModel: reportModel),
//                 SizedBox(height: 16.h),
//                 WorkShiftWidget(reportModel: reportModel),
//                 SizedBox(height: 16.h),
//                 InputDataWidget(
//                   controller: TextEditingController(text: reportModel.duration),
//                   hint: "المدة ",
//                   title: "المدة",
//                   fillColor: context.color.onPrimaryContainer,
//                 ),
//                 SizedBox(height: 16.h),
//                 // //المراجع الاول الثانى
//                 Row(
//                   children:
//                   AccountModel.accountList
//                       .map((e) => AccountWidget(accountModel: e))
//                       .toList(),
//                 ),
//                 SizedBox(height: 16.h),
//                 AddDocumentButtonWidget(
//                   onTap: (){},
//                   title: "الوثائق",
//                   widget: SizedBox(
//                     width: 20.w,
//                     height: 25.h,
//                     child: Image.asset(Assets.requestPdf),
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 NotsDetailsWidget(reportModel: reportModel,),
//                 SizedBox(height: 16.h),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
