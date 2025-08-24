import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/date_cubit/date_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_screen_body.dart';
import '../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../administrative_request/presentation/control/get_employee_administrative_request/get_employee_Administrative_request_cubit.dart';
import '../../../administrative_request/presentation/control/post_administrative_request/post_administrative_request_cubit.dart';
import '../../../administrative_request/presentation/screen/all_administrative_request_widget.dart';
import '../../../financial_request/presentation/control/get_employee_financial_request/get_employee_financial_request_cubit.dart';
import '../../../financial_request/presentation/control/post_financial_request/post_financial_request_cubit.dart';
import '../../../financial_request/presentation/screen/all_financial_request_widget.dart';
import '../../../mission_request/presentation/control/get_employee_mission/get_employee_mission_cubit.dart';
import '../../../mission_request/presentation/control/get_mission_request/get_mission_request_cubit.dart';
import '../../../mission_request/presentation/control/get_reviewer_mission_request/get_reviewer_mission_request_cubit.dart';
import '../../../mission_request/presentation/screen/all_mission_request_widget.dart';
import '../../../permission_request/presentation/control/get_allowed_permission/get_allowed_permission_cubit.dart';
import '../../../permission_request/presentation/control/get_employee_permission/get_employee_permission_cubit.dart';
import '../../../permission_request/presentation/control/get_permission_request/get_permission_request_cubit.dart';
import '../../../permission_request/presentation/control/get_reviewer_permission/get_reviewer_permission_cubit.dart';
import '../../../permission_request/presentation/screen/all_permission_request_widget.dart';
import '../../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../control/all_request/all_request_cubit.dart';
import '../control/request/request_cubit.dart';
import '../control/tab_switcher/tab_switcher_cubit.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: provideCubit(),
      child: SafeArea(child: SingleChildScrollView(
          child: BlocBuilder<RequestCubit, int>(
            builder: (context, state) {
              if(state == 0) {
                return RequestScreenBody();
              }
              if(state == 1) {
                return AllAdministrativeRequestWidget();
              }
              if(state == 2) {
                return AllPerMissionRequestWidget();
              }
              if(state == 6) {
                return const AllFinancialRequestWidget();
              }
              if(state == 7) {
                return const AllMissionRequestWidget();
              }
              return Text(state.toString());
            },
          ))),
    );
  }

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
            sl<AllRequestCubit>(),
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

    ];
  }
}
