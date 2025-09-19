import 'export_file.dart';
provideCubit() {
  return [
    BlocProvider<RequestCubit>(create: (context) => RequestCubit()),
    BlocProvider<TabSwitcherCubit>(create: (context) => TabSwitcherCubit()),
    BlocProvider(
      create: (context) => DateCubit(),
    ),
    BlocProvider(
      create:
          (context) => sl<DefaultReviewerCubit>()..fetchDefaultReviewers(),
    ),

    BlocProvider(
      create:
          (context) =>
      sl<GetEmployeeAdministrativeRequestCubit>()
        ..getEmployeeAdministrativeRequest(),
    ),
    BlocProvider(
      create:
          (context) =>
          sl<PostAdministrativeRequestCubit>(),
    ),
    BlocProvider(
      create:
          (context) =>
      sl<GetEmployeeFinancialRequestCubit>()
        ..getEmployeeFinancialRequest(),
    ),
    BlocProvider(
      create:
          (context) =>
          sl<PostFinancialRequestCubit>(),
    ),
    BlocProvider(
      create:
          (context) =>
      sl<GetMissionRequestCubit>()..getMission(),
    ),
    BlocProvider(
      create:
          (context) =>
      sl<GetEmployeeMissionCubit>()..getEmployeeMission(),
    ),
    BlocProvider(
      create:
          (context) =>
      sl<GetReviewerMissionRequestCubit>()..getReviewerMissionRequest(),
    ),
    BlocProvider(
      create:
          (context) =>
      sl<GetPerMissionRequestCubit>()..getPerMission(),
    ),
    BlocProvider(
      create:
          (context) =>
      sl<GetAllowedPerMissionRequestCubit>()..getAllowedPerMission(),
    ),
    BlocProvider(
      create:
          (context) =>
      sl<GetEmployeePerMissionRequestCubit>()..getEmployeePerMission(),
    ),
    BlocProvider(
      create:
          (context) =>
      sl<GetReviewerPerMissionRequestCubit>()..getReviewerPerMission(),
    ),
    BlocProvider(
      create:
          (context) =>
          sl<AllRequestCubit>(),
    ),


//over time
    BlocProvider(
        create:
            (context) =>
        sl<GetEmployeeOverTimeCubit>()..getEmployeeOverTime()
    ),
    BlocProvider(
        create:
            (context) =>
        sl<GetReviewerOverTimeCubit>()..getReviewerOverTime()
    ),

  ];
}
