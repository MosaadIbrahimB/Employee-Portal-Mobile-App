import '../../../../../core/utils/app_color.dart';
import '../../../../request/presentation/widget/list_reviewer_widget.dart';
import '../../../../vacation/presentation/widget/vacation_request/reviewer_widget.dart';
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
          child:
              BlocConsumer<PostOverTimeRequestCubit, PostOverTimeRequestState>(
                listener: (context, state) {
                  if (state.errorMessage != null) {
                    context.showErrorDialog(state.errorMessage ?? "Error");
                  }
                  if (state.response != null) {
                    List<ResponsePostOverTimeModel>? r = state.response ?? [];
                    for (var e in r) {
                      if (e.isValid == false) {
                        context.showErrorDialog(e.message ?? "Error");
                      }
                      if (e.isValid == true) {
                        context.showSnackBar(
                          " الطلب قيد الاعتماد",

                          backgroundColor: AppColor.freshGreen,
                        );
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
                      CustomListAlertsOverTimeWidget(),
                      SizedBox(height: 16.h),
                      ReviewerWidget(),
                      SizedBox(height: 16.h),
                      ListReviewerWidget(),
                      SizedBox(height: 16.h),
                      CustomButtonWidget(
                        onTap: () {
                          List<AlertModel>? alerts =
                              context
                                  .read<GetAlertsOverTimeCubit>()
                                  .state
                                  .listOverTimeSelected;
                          if (alerts == null || alerts.isEmpty) {
                            context.showErrorDialog(
                              "يرجى اختيار تنبيه واحد على الاقل",
                            );
                            return;
                          }

                          RequestPostOverTimeModel postOverTime =
                              requestPostOverTime(context);
                          context
                              .read<PostOverTimeRequestCubit>()
                              .postOverTimeRequest(
                                requestPostOverTimeModel: postOverTime,
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
    int? value =
        context
            .read<GetAlertsOverTimeCubit>()
            .state
            .listOverTimeSelected?[0]
            .duration
            ?.toInt() ??
        0;
    List<DefaultReviewerModel>? reviewers =
        context.read<DefaultReviewerCubit>().state.listSelectedReviewers;

    List<AlertModel>? alerts =
        context.read<GetAlertsOverTimeCubit>().state.listOverTimeSelected;

    //---------------------------------

    RequestPostOverTimeModel requestPostOverTimeModel =
        RequestPostOverTimeModel(
          request: RequestOfPostOverTimeModel(
            requestType: 7,
            date: DateTime.now().toIso8601String(),
            value: 78,
            reviewers: reviewers,
          ),
          alerts: alerts,
        );

    return requestPostOverTimeModel;
  }
}


