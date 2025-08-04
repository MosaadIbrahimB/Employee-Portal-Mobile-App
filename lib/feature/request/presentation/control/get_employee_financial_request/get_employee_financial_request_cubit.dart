import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_employee_financial_use_case.dart';
import 'get_employee_financial_request_state.dart';

class  GetEmployeeFinancialRequestCubit extends Cubit< GetEmployeeFinancialRequestState>{
  GetEmployeeFinancialRequestCubit({required this.getEmployeeFinancialRequestUseCase}):super(GetEmployeeFinancialRequestState());
  GetEmployeeFinancialUseCase  getEmployeeFinancialRequestUseCase  ;

  getEmployeeFinancialRequest() async {

    emit(state.copyWith(isLoading: true));
    final response = await getEmployeeFinancialRequestUseCase();
    response.fold(
          (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
          (resulte) {
        emit(state.copyWith(isLoading: false, response: resulte));
      },
    );
  }

}
