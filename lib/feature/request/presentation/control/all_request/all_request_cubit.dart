import 'package:employee_portal_mobile_app/feature/mission_request/presentation/control/get_mission_request/get_mission_request_cubit.dart';

import '../../../../financial_request/presentation/control/get_employee_financial_request/get_employee_financial_request_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/control/get_employee_administrative_request/get_employee_administrative_request_cubit.dart';
import 'all_request_state.dart';

class AllRequestCubit extends Cubit<AllRequestState> {
  final GetEmployeeAdministrativeRequestCubit adminCubit;
  final GetEmployeeFinancialRequestCubit financialCubit;
  final GetMissionRequestCubit missionCubit;

  AllRequestCubit({
    required this.adminCubit,
    required this.financialCubit,
    required this.missionCubit,
  }) : super(const AllRequestState(isLoading: true)) {
    // استمع لتغيرات الكيوبتين
    adminCubit.stream.listen((_) => _combine());
    financialCubit.stream.listen((_) => _combine());
    missionCubit.stream.listen((_) => _combine());

    _fetchData();
  }
  void _fetchData() {
    adminCubit.getEmployeeAdministrativeRequest();
    financialCubit.getEmployeeFinancialRequest();
    missionCubit.getMission();
  }
  void _combine() {
    final isLoading = (adminCubit.state.isLoading ?? false) || (financialCubit.state.isLoading ?? false);

    final errorMessage = adminCubit.state.errorMessage ?? financialCubit.state.errorMessage;

    final adminList = adminCubit.state.response ?? [];
    final financialList = financialCubit.state.response ?? [];
    final missionList = missionCubit.state.response ?? [];

    final combinedList = [...adminList, ...financialList, ...missionList];

    emit(AllRequestState(
      isLoading: isLoading,
      errorMessage: errorMessage,
      response: combinedList,
    ));
  }
}


