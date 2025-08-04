import '../get_employee_administrative_request/get_employee_administrative_request_cubit.dart';
import '../get_employee_financial_request/get_employee_financial_request_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_request_state.dart';

class AllRequestCubit extends Cubit<AllRequestState> {
  final GetEmployeeAdministrativeRequestCubit adminCubit;
  final GetEmployeeFinancialRequestCubit financialCubit;

  AllRequestCubit({
    required this.adminCubit,
    required this.financialCubit,
  }) : super(const AllRequestState(isLoading: true)) {
    // استمع لتغيرات الكيوبتين
    adminCubit.stream.listen((_) => _combine());
    financialCubit.stream.listen((_) => _combine());

    _fetchData();
  }
  void _fetchData() {
    adminCubit.getEmployeeAdministrativeRequest();
    financialCubit.getEmployeeFinancialRequest();
  }
  void _combine() {
    final isLoading = (adminCubit.state.isLoading ?? false) || (financialCubit.state.isLoading ?? false);

    final errorMessage = adminCubit.state.errorMessage ?? financialCubit.state.errorMessage;

    final adminList = adminCubit.state.response ?? [];
    final financialList = financialCubit.state.response ?? [];

    final combinedList = [...adminList, ...financialList];

    emit(AllRequestState(
      isLoading: isLoading,
      errorMessage: errorMessage,
      response: combinedList,
    ));
  }
}


