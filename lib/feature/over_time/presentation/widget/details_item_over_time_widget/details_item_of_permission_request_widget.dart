import 'package:employee_portal_mobile_app/core/component/custom_reviewer_widget.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/presentation/widget/from_date_widget.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/presentation/widget/from_to_mission_widget.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/response_over_time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/custom_nots_of_details_screen_widget.dart';
import '../../../../../core/component/custom_title_and_value_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../../administrative_request/presentation/widget/app_bar_management_request_widget.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/add_document_button_widget.dart';
class DetailsItemOverTimeWidget extends StatelessWidget {
  const DetailsItemOverTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabSwitcherCubit, int>(
      builder: (context, state) {
        ResponseOverTimeModel model = context.read<TabSwitcherCubit>().getModel();

        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            // معتمده - تحت الطلب -مرفوض
            Row(
              children: [
                AppBarAdministrativeRequestWidget(
                    icon: Icons.close,
                    title: "تفاصيل اليوم",
                    onTap: () {
                      context.read<TabSwitcherCubit>().changeTab(0);
                    }
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.onSecondary),
                  child: Text(
                    model.status ?? "الحالة",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),

              ],
            ),
            SizedBox(height: 16.h),
            FromDateWidget(date: model.date.toString().substring(0,10)?? "غير متاح"),
            SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "النوع",
              value: model.requestTypeName ?? "غير متاح",
            ),

            SizedBox(height: 16.h),

            // Row(
            //   children: [
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text("من", style: Theme.of(context).textTheme.bodyMedium),
            //           SizedBox(height: 8.h),
            //           FromToMissionWidget(
            //             date: model.from,
            //             time: model.from.toString().substring(11)??"9:00 صباحاً",
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(width: 8.w),
            //     Expanded(
            //       child:  Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text("الى", style: Theme.of(context).textTheme.bodyMedium),
            //           SizedBox(height: 8.h),
            //           FromToMissionWidget(
            //             date: model.to,
            //             time: model.to.toString().substring(11)?? "9:00 صباحاً",
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 16.h),
            CustomTitleAndValueWidget(
              title: "المدة",
              value: model.value.toString() ?? "غير متاح",
            ),
            SizedBox(height: 16.h),
            if (model.reviewers!=null)
              Row(
                children:
                model.reviewers!
                    .map(
                      (e) => CustomReviewerWidget(
                    nameReviewer: e.name,
                    statusReviewer: e.status,
                  ),
                )
                    .toList(),
              ),
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
            CustomNotsOfDetailsScreenWidget(notText: model.notes,),
          ],
        );
      },
    );
  }
}

