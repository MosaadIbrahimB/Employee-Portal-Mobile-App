import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_employee_administrative_request_use_case.dart';
import 'get_employee_administrative_request_state.dart';


class  GetEmployeeAdministrativeRequestCubit extends Cubit< GetEmployeeAdministrativeRequestState>{
  GetEmployeeAdministrativeRequestCubit({required this.getEmployeeAdministrativeRequestUseCase}):super(GetEmployeeAdministrativeRequestState());
  GetEmployeeAdministrativeRequestUseCase  getEmployeeAdministrativeRequestUseCase  ;

  getEmployeeAdministrativeRequest() async {

    emit(state.copyWith(isLoading: true));
    final response = await getEmployeeAdministrativeRequestUseCase();
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

