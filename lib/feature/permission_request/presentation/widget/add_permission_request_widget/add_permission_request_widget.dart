import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../mission_request/presentation/widget/mission_request_date_widget.dart';
import '../../../../mission_request/presentation/widget/mission_request_time_widget.dart';
import '../../../../request/presentation/control/date_cubit/date_cubit.dart';
import '../../../../request/presentation/control/date_cubit/date_state.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/add_document_button_widget.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';
import '../../../../request/presentation/widget/list_reviewer_widget.dart';
import '../../../../request/presentation/widget/notes_input_field.dart';
import '../../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';
import '../../../../vacation/data/model/post_vacation/post_vacation_request_model.dart';
import '../../../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../../../../vacation/presentation/widget/vacation_request/reviewer_widget.dart';
import '../../../data/model/post/request_post_permission_model.dart';
import '../../control/get_allowed_permission/get_allowed_permission_cubit.dart';
import '../../control/post_permission_request/post_permission_request_cubit.dart';
import '../../control/post_permission_request/post_permission_request_state.dart';
import 'allowed_permission_request_dropdown_widget.dart';

class AddPerMissionRequestWidget extends StatelessWidget {
  const AddPerMissionRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
        child: BlocProvider(
          create: (context) => sl<PostPerMissionRequestCubit>(),
          child: BlocConsumer<
            PostPerMissionRequestCubit,
            PostPerMissionRequestState
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

                  PostPerMissionRequestCubit.noteInputController.clear();
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
                    title: "طلب اذن ",
                    onTap: () {
                      context.read<TabSwitcherCubit>().changeTab(0);
                    },
                  ),
                  SizedBox(height: 20.h),
                  AllowedPerMissionDropdownWidget(),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      MissionRequestDateWidget(
                        title: ' من يوم',
                        onDateSelected: (date) {
                          context.read<DateCubit>().setFromDate(date);
                        },
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: MissionRequestTimeWidget(
                          title: "من الساعة",
                          onTimeSelected: (time) {
                            context.read<DateCubit>().setFromTime(time);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      MissionRequestDateWidget(
                        title: " الى يوم",
                        onDateSelected: (date) {
                          context.read<DateCubit>().setToDate(date);
                        },
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: MissionRequestTimeWidget(
                          title: "الى الساعة",
                          onTimeSelected: (time) {
                            context.read<DateCubit>().setToTime(time);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text("المدة", style: context.text.titleSmall),

                  SizedBox(height: 8.h),

                  Container(
                    width: double.infinity,
                    padding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
                    decoration: BoxDecoration(
                      border: Border.all(color: context.color.outline),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BlocBuilder<DateCubit, DateState>(
                      builder: (context, state) {
                        final duration = state.duration;
                        if (duration == null) {
                          return Text(
                            "المدة غير محددة",
                            style: context.text.bodyMedium,
                          );
                        }

                        final days = duration.inDays;
                        final hours = duration.inHours.remainder(24);
                        final minutes = duration.inMinutes.remainder(60);

                        return Text(
                          "$days يوم - $hours ساعة - $minutes دقيقة",
                          style: context.text.bodyMedium,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  NotesInputField(
                    controller: PostPerMissionRequestCubit.noteInputController,
                  ),
                  SizedBox(height: 44.h),
                  AddDocumentButtonWidget(),
                  SizedBox(height: 16.h),
                  ReviewerWidget(),
                  SizedBox(height: 16.h),
                  ListReviewerWidget(),
                  SizedBox(height: 16.h),

                  CustomButtonWidget(
                    onTap: () {
                      int ?permissionType =
                          context
                              .read<GetAllowedPerMissionRequestCubit>()
                              .state
                              .selectedRequestType?.id;
                      if (permissionType == null) {
                        context.showErrorDialog(
                          "الرجاء اختيار نوع طلب الاذن",
                        );
                        return;
                      }
                      List<DefaultReviewerModel>   reviewers=
                      context.read<DefaultReviewerCubit>().state.listSelectedReviewers;

                      if (reviewers.isEmpty) {
                        context.showErrorDialog(
                          "الرجاء اختيار المراجعين للطلب",
                        );
                        return;
                      }

                      context
                          .read<PostPerMissionRequestCubit>()
                          .postPreMissionRequest(
                            requestMission: getSelectedRequest(context),
                          );
                    },
                    title: "قدم الطلب",
                  ),
                  SizedBox(height: 30.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  RequestPostPermissionModel getSelectedRequest(BuildContext context) {
    final fromDate = context.read<DateCubit>().state.fromDate!;
    final fromTime = context.read<DateCubit>().state.fromTime;
    final toDate = context.read<DateCubit>().state.toDate!;
    final toTime = context.read<DateCubit>().state.toTime;

    final dateFrom = DateTime(
      fromDate.year,
      fromDate.month,
      fromDate.day,
      fromTime?.hour ?? 0,
      fromTime?.minute ?? 0,
    );

    final dateTo = DateTime(
      toDate.year,
      toDate.month,
      toDate.day,
      toTime?.hour ?? 0,
      toTime?.minute ?? 0,
    );

    context.read<DateCubit>().setFromDate(dateFrom);
    context.read<DateCubit>().setToDate(dateTo);

    final duration = context.read<DateCubit>().state.duration?.inMinutes ?? 0;



    int permissionType = context.read<GetAllowedPerMissionRequestCubit>().state.selectedRequestType?.id??1;
    return RequestPostPermissionModel(
      permissionType: permissionType,
      fromDate:dateFrom.toIso8601String(),
      toDate: dateTo.toIso8601String(),
      notes: PostPerMissionRequestCubit.noteInputController.text,
      request: RequestModel(
        reviewers:
            context.read<DefaultReviewerCubit>().state.listSelectedReviewers,
      ),
    );
  }
}
