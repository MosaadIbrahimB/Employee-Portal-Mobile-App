import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_employee_reviewed_administrative_request_use_case.dart';
import '../../../domain/use_case/get_financial_request_use_case.dart';
import 'get_employee_reviewed_administrative_request_state.dart';


class  GetEmployeeReviewedAdministrativeRequestCubit extends Cubit< GetEmployeeReviewedAdministrativeRequestState>{
  GetEmployeeReviewedAdministrativeRequestCubit({required this.getEmployeeReviewedAdministrativeRequestUseCase}):super(GetEmployeeReviewedAdministrativeRequestState());
  GetEmployeeReviewedAdministrativeRequestUseCase  getEmployeeReviewedAdministrativeRequestUseCase  ;

  getEmployeeReviewedAdministrativeRequest() async {

    emit(state.copyWith(isLoading: true));
    final response = await getEmployeeReviewedAdministrativeRequestUseCase();
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

