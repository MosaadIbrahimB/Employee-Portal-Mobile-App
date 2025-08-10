import 'package:employee_portal_mobile_app/feature/administrative_request/domain/use_case/get_employee_administrative_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/control/get_employee_administrative_request/get_employee_administrative_request_state.dart';


class  GetEmployeeAdministrativeRequestCubit extends Cubit< GetEmployeeAdministrativeRequestState>{
  GetEmployeeAdministrativeRequestCubit({required this.getEmployeeAdministrativeRequestUseCase}):super(GetEmployeeAdministrativeRequestState());
  GetEmployeeAdministrativeUseCase  getEmployeeAdministrativeRequestUseCase  ;

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
