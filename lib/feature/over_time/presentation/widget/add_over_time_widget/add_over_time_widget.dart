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
            BlocProvider(create: (context) => sl<GetAlertsOverTimeCubit>()..getAlertOverTime(DateTime.now().toString(), DateTime.now().toString())),
            BlocProvider(create: (context) => sl<GetTypeOverTimeCubit>()..getTypeOverTime()),
          ],
          child: BlocConsumer<
            PostOverTimeRequestCubit,
            PostOverTimeRequestState
          >(
            listener: (context, state) {
              if (state.response != null) {
                if (state.response!.isValid == false) {
                  context.showErrorDialog(
                    state.response?.message ?? "حدث خطأ ما",
                  );
                  return;
                }

                if (context.mounted) {
                  // BlocProvider.of<RequestCubit>(context).changePage(0);
                  context.read<TabSwitcherCubit>().changeTab(0);

                  context.showSnackBar(
                    " الطلب قيد الاعتماد",
                    backgroundColor: Colors.green,
                  );
                  PostOverTimeRequestCubit.noteInputController.clear();
                  context.read<DateCubit>().state.copyWith(
                    duration: null,
                    fromDate: null,
                    toDate: null,
                    fromTime: null,
                    toTime: null,
                  );
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
                            String fromDate = context
                                .read<DateCubit>()
                                .state
                                .fromDate
                                .toString();
                            String toDate = context
                                .read<DateCubit>()
                                .state
                                .toDate
                                .toString();
                            
                            
                            context.read<GetAlertsOverTimeCubit>().getAlertOverTime(fromDate, toDate);

                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomListAlertsOverTimeWidget()
                ],
              );
            },
          ),
        ),
      ),
    );
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
