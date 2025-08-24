import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../request/presentation/control/date_cubit/date_cubit.dart';
import '../../../../request/presentation/control/date_cubit/date_state.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../../request/presentation/widget/add_document_button_widget.dart';
import '../../../../request/presentation/widget/app_bar_request_widget.dart';
import '../../../../request/presentation/widget/list_reviewer_widget.dart';
import '../../../../request/presentation/widget/notes_input_field.dart';
import '../../../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../../../../vacation/presentation/widget/vacation_request/reviewer_widget.dart';
import '../../../data/model/post_mission/post_mission_request_model.dart';
import '../../control/post_mission_request/post_mission_request_cubit.dart';
import '../../control/post_mission_request/post_mission_request_state.dart';
import '../mission_request_date_widget.dart';
import '../mission_request_time_widget.dart';

class AddMissionRequestWidget extends StatelessWidget {
  const AddMissionRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
        child: BlocProvider(
          create: (context) => sl<PostMissionRequestCubit>(),
          child: BlocConsumer<PostMissionRequestCubit, PostMissionRequestState>(
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
                  PostMissionRequestCubit.destinationController.clear();
                  PostMissionRequestCubit.durationController.clear();
                  PostMissionRequestCubit.noteInputController.clear();
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
                    title: "طلب مأمورية ",
                    onTap: () {
                      context.read<TabSwitcherCubit>().changeTab(0);
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text("الوجهة", style: context.text.titleSmall),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: PostMissionRequestCubit.destinationController,
                    decoration: InputDecoration(
                      hintText: "الرجاء إدخال الوجهة",
                      border: OutlineInputBorder(),
                    ),
                  ),
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
              return Text("المدة غير محددة", style: context.text.bodyMedium);
              }

              final days = duration.inDays;
              final hours = duration.inHours.remainder(24);
              final minutes = duration.inMinutes.remainder(60);
              print(duration.toString().substring(0,8));
              
              return Text(
              "$days يوم - $hours ساعة - $minutes دقيقة",
              style: context.text.bodyMedium,
              );
              },
              ),
                  ),

                  SizedBox(height: 16.h),
                  NotesInputField(
                    controller: PostMissionRequestCubit.noteInputController,
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
                      String? destination =
                          PostMissionRequestCubit.destinationController.text;
                      if (destination.isEmpty) {
                        context.showErrorDialog("الرجاء إدخال الوجهة");
                        return;
                      }

                      context
                          .read<PostMissionRequestCubit>()
                          .postMissionRequest(
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

  RequestPostMissionModel getSelectedRequest(BuildContext context) {
    int duration =
        int.tryParse(context.read<DateCubit>().state.duration.toString()) ?? 0;
    return RequestPostMissionModel(
      destination: PostMissionRequestCubit.destinationController.text,
      duration: duration,
      from: context.read<DateCubit>().state.fromDate.toString(),
      to: context.read<DateCubit>().state.toDate.toString(),
      unit: 1,
      notes: PostMissionRequestCubit.noteInputController.text,
      request: Request(
        reviewers:
            context.read<DefaultReviewerCubit>().state.listSelectedReviewers,
      ),
    );
  }
}
