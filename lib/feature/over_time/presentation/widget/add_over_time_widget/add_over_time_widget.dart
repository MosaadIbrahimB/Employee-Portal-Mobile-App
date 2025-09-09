import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/over_time/presentation/control/get_type_over_time/get_type_over_time_cubit.dart';
import 'package:employee_portal_mobile_app/feature/over_time/presentation/control/post_over_time/post_over_time_request_cubit.dart';
import 'package:employee_portal_mobile_app/feature/over_time/presentation/widget/add_over_time_widget/type_over_time_request_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../mission_request/presentation/widget/mission_request_date_widget.dart';
import '../../../../request/presentation/control/date_cubit/date_cubit.dart';
import '../../../../request/presentation/control/request/request_cubit.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';
import '../../../../splash/presentation/widget/custom_button_widget.dart';
import '../../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';
import '../../../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../../../data/model/alert_model.dart';
import '../../../data/model/post/request_of_post_over_time_model.dart';
import '../../../data/model/post/request_post_over_time_model.dart';
import '../../../data/model/post/response_post_over_time_model.dart';
import '../../control/get_alerts_over_time/get_alerts_over_time_cubit.dart';
import '../../control/post_over_time/post_over_time_request_state.dart';
import '../tab_of_app_bar_switcher_widget.dart';
import 'custom_list_alerts_over_time_widget.dart';

class AddOverTimeWidget extends StatelessWidget {
  const AddOverTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<PostOverTimeRequestCubit>()),
            BlocProvider(
              create:
                  (context) =>
                      sl<GetAlertsOverTimeCubit>()..getAlertOverTime(
                        DateTime.now().toString(),
                        DateTime.now().toString(),
                      ),
            ),
            BlocProvider(
              create:
                  (context) => sl<GetTypeOverTimeCubit>()..getTypeOverTime(),
            ),
          ],
          child: BlocConsumer<
            PostOverTimeRequestCubit,
            PostOverTimeRequestState
          >(
            listener: (context, state) {
              if(state.errorMessage!=null){
               context.showErrorDialog(state.errorMessage??"Error");
              }
              if (state.response != null) {
                List <ResponsePostOverTimeModel>? r= state.response ?? [];
                for (var e in r) {
                  if (e.isValid == false) {
                    context.showErrorDialog(e.message ?? "Error");
                  }
                  if (e.isValid == true) {
                    context.showSnackBar(e.message ?? "Success");
                    context.read<RequestCubit>().changePage(0);
                    context.read<TabSwitcherCubit>().changeTab(0);
                  }
                }

              }

            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  AppBarRequestWidget(
                    icon: Icons.close,
                    title: "اطلب اضافى",
                    onTap: () {
                      context.read<RequestCubit>().changePage(0);
                      context.read<TabSwitcherCubit>().changeTab(0);
                    },
                  ),
                  SizedBox(height: 12.h),
                  TabOfAppBarSwitcherWidget(
                    tabs: [
                      'اضافة طلب اضافى',
                      'طلباتى للاضافى',
                      'اعتمادات الاضافى',
                    ],
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(height: 20.h),
                  TypeOverTimeRequestDropdownWidget(),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: MissionRequestDateWidget(
                          title: ' من يوم',
                          onDateSelected: (date) {
                            context.read<DateCubit>().setFromDate(date);
                          },
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: MissionRequestDateWidget(
                          title: " الى يوم",
                          onDateSelected: (date) {
                            context.read<DateCubit>().setToDate(date);
                            String fromDate =
                                context
                                    .read<DateCubit>()
                                    .state
                                    .fromDate
                                    .toString();
                            String toDate =
                                context
                                    .read<DateCubit>()
                                    .state
                                    .toDate
                                    .toString();

                            context
                                .read<GetAlertsOverTimeCubit>()
                                .getAlertOverTime(fromDate, toDate);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: context.height * .40,
                    child: CustomListAlertsOverTimeWidget(),
                  ),
                  SizedBox(height: 16.h),
                  CustomButtonWidget(
                    onTap: () {
                      RequestPostOverTimeModel  postOverTime= requestPostOverTime(context);
                      context
                          .read<PostOverTimeRequestCubit>()
                          .postOverTimeRequest(
                        requestPostOverTimeModel:postOverTime
                       ,
                      );
                    },
                    title: "قدم الطلب",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  RequestPostOverTimeModel requestPostOverTime(BuildContext context) {
    int? requestType =
        context
            .read<GetTypeOverTimeCubit>()
            .state
            .selectedRequestType
            ?.id;
    String? date =
    context
        .read<DateCubit>()
        .state
        .fromDate
        ?.toString();
    int? value =
        context
            .read<GetAlertsOverTimeCubit>()
            .state
            .listOverTimeSelected?[0]
            .duration
            ?.toInt() ??
            0;
    List<DefaultReviewerModel>? reviewers =
        context
            .read<DefaultReviewerCubit>()
            .state
            .listSelectedReviewers;
    List<AlertModel>? alerts=  context
        .read<GetAlertsOverTimeCubit>()
        .state
        .listOverTimeSelected;

    RequestPostOverTimeModel requestPostOverTimeModel =
    RequestPostOverTimeModel(
      request: RequestOfPostOverTimeModel(
        requestType: requestType,
        date: date,
        value: value,
        reviewers: reviewers,
      ),
      alerts:alerts,

    );


    return requestPostOverTimeModel;
  }
}

// final x = RequestPostMissionModel(
//   destination: "A120",
//   duration: 300,
//   from: "2025-09-26T16:43:47.77",
//   to: "2025-09-26T19:40:47.77",
//   unit: 1,
//   notes: PostMissionRequestCubit.noteInputController.text,
//   request: Request(
//     reviewers: context.read<DefaultReviewerCubit>().state.listSelectedReviewers,
//   ),
// );
// print("${x.from} --------------------- r.from ---------------------------");
// RequestPostMissionModel getSelectedRequest(BuildContext context) {
//   final fromDate = context.read<DateCubit>().state.fromDate!;
//   final fromTime = context.read<DateCubit>().state.fromTime;
//   final toDate = context.read<DateCubit>().state.toDate!;
//   final toTime = context.read<DateCubit>().state.toTime;
//
//   final dateFrom = DateTime(
//     fromDate.year,
//     fromDate.month,
//     fromDate.day,
//     fromTime?.hour ?? 0,
//     fromTime?.minute ?? 0,
//   );
//
//   final dateTo = DateTime(
//     toDate.year,
//     toDate.month,
//     toDate.day,
//     toTime?.hour ?? 0,
//     toTime?.minute ?? 0,
//   );
//
//   context.read<DateCubit>().setFromDate(dateFrom);
//   context.read<DateCubit>().setToDate(dateTo);
//
//   final duration = context.read<DateCubit>().state.duration?.inMinutes ?? 0;
//
//   final r = RequestPostMissionModel(
//     destination: PostMissionRequestCubit.destinationController.text,
//     duration: duration,
//     from: dateFrom.toIso8601String(),
//     to: dateTo.toIso8601String(),
//     unit: 1,
//     notes: PostMissionRequestCubit.noteInputController.text,
//     request: Request(
//       reviewers: context.read<DefaultReviewerCubit>().state.listSelectedReviewers,
//     ),
//   );
//
//   return r;
// }
/*
 final RequestPostOverTimeModel jsonData = RequestPostOverTimeModel(
      request: RequestOfPostOverTimeModel(
        requestType: 7,
        date: "2025-05-12 20:30:00.000",
        value: 78,
        reviewers: [
          DefaultReviewerModel(
              employeeId: 121, code: "", name: "",
          ),
          DefaultReviewerModel(
            employeeId: 121, code: "", name: "",
          ),

        ]
      ),
      alerts: [
        AlertModel(
          id: 1223557,
          date: "2025-05-17T10:00:00.000",
          duration: 78,
        notes: "sadadadasdasdasd"
        )
      ]
    );
 */