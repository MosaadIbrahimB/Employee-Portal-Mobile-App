import 'package:employee_portal_mobile_app/feature/administrative_request/domain/use_case/get_reviewer_administrative_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/control/get_reviewer_administrative_request/get_reviewer_administrative_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  GetReviewerAdministrativeRequestCubit extends Cubit< GetReviewerAdministrativeRequestState>{
  GetReviewerAdministrativeRequestCubit({required this.getReviewerAdministrativeRequestUseCase}):super(GetReviewerAdministrativeRequestState());
  GetReviewerAdministrativeRequestUseCase  getReviewerAdministrativeRequestUseCase  ;

  getReviewerAdministrativeRequest() async {

    emit(state.copyWith(isLoading: true));
    final response = await getReviewerAdministrativeRequestUseCase();
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

