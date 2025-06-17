import 'package:employee_portal_mobile_app/core/component/custom_app_bar_screen_details_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_from_to_date_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_nots_of_details_screen_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_reviewer_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_title_and_value_widget.dart';
import 'package:employee_portal_mobile_app/core/model/reviewer_model.dart';
import 'package:employee_portal_mobile_app/core/model/status_model.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_request/add_document_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/details_management_request/submission_date_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VacationDetailsWidget extends StatelessWidget {
  const VacationDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GetEmployeeVacationsModel model =
        context.read<VacationCubit>().getEmployeeVacationsModel();
    List<ReviewerModel?> reviewer = model.reviewer ?? [];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            // معتمده - تحت الطلب -مرفوض

            CustomAppBarScreenWidget(
              title: "تفاصيل أجازتى",
              onTap: () {
                context.read<VacationCubit>().changeTab(2);
              },
              icon: Icons.close,
              statusModel: StatusModel.employeeVacationsModel(
                employeeVacationsModel: model,
              ),
              isDetailsScreen: true,
            ),

            SizedBox(height: 16.h),
            // // النوع
            CustomTitleAndValueWidget(title: "العنوان", value: model.typeName),
            SizedBox(height: 16.h),
            // //   التاريخ
            SubmissionDateWidget(
              reportModel: ReportModel(dateRequest: model.fromDate),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomFromToDateWidget(
                    title: "من",
                    date: model.fromDate ?? "22 نوفمبر2024",
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomFromToDateWidget(
                    title: "الى",
                    date: model.toDate ?? "22 نوفمبر2024",
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "المدة",
              value: model.duration.toString(),
            ),
            SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "النائب",
              value: model.employeeSecondName,
            ),
            SizedBox(height: 16.h),
            if (reviewer.isNotEmpty)
              Row(
                children:
                    reviewer
                        .map(
                          (e) => CustomReviewerWidget(
                            reviewerModel: e!,
                            statusModel: StatusModel.reviewerModel(model: e),
                          ),
                        )
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
            CustomNotsOfDetailsScreenWidget(notText: model.notes,),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
