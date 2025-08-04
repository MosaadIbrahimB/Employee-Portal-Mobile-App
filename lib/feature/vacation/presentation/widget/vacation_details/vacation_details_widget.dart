import 'package:employee_portal_mobile_app/core/component/custom_app_bar_screen_details_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_from_to_date_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_nots_of_details_screen_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_reviewer_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_title_and_value_widget.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_document_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

class VacationDetailsWidget extends StatelessWidget {
  const VacationDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GetEmployeeVacationsResponseModel model =
        context.read<VacationCubit>().getEmployeeVacationsModel();
    // List<ReviewerModel?> reviewer = model.reviewer ?? [];
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
            ),

            SizedBox(height: 16.h),
            // // النوع
            CustomTitleAndValueWidget(
              title: "العنوان",
              value: model.vacationTypeName,
            ),
            SizedBox(height: 16.h),
            // //
            //
            // التاريخ
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("تاريخ تقديم الطلب", style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: context.color.surfaceContainer,
                      size: 22.r,
                    ),
                    SizedBox(width: 8.w),
                    Text("${model.fromDate?.substring(0, 10)}", style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ],
          ),

            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomFromToDateWidget(
                    title: "من",
                    date: model.fromDate?.substring(0, 10) ?? "22 نوفمبر2024",
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomFromToDateWidget(
                    title: "الى",
                    date: model.toDate?.substring(0, 10) ?? "22 نوفمبر2024",
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
              value: model.replacementName,
            ),
            SizedBox(height: 16.h),




            Row(
              children: [
                CustomReviewerWidget(
                  nameReviewer: model.reviewerName!.isEmpty?"اسم": model.reviewerName,
                  idReviewer: "كود ",
                  statusReviewer:"حالة" ,

                ),
              ],
            ),

            // if (model.reviewer.isNotEmpty)
            //   Row(
            //     children:
            //         reviewer
            //             .map(
            //               (e) => CustomReviewerWidget(
            //                 reviewerModel: e!,
            //                 statusModel: StatusModel.reviewerModel(model: e),
            //               ),
            //             )
            //             .toList(),
            //   ),
            SizedBox(height: 16.h),
            AddDocumentButtonWidget(
              onTap: () {},
              title: "الوثائق",
              widget: SizedBox(
                width: 20.w,
                height: 25.h,
                child: Image.asset(Assets.requestPdf),
              ),
            ),
            SizedBox(height: 16.h),
            CustomNotsOfDetailsScreenWidget(notText: "ملاحظات",),
            // SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
