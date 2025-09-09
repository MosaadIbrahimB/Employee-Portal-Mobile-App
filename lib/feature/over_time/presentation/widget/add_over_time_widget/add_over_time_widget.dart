import 'file_export.dart';

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