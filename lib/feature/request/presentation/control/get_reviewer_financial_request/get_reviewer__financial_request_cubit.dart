import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_reviewer_administrative_request.dart';
import '../../../domain/use_case/get_reviewer_financial_request_use_case.dart';
import 'get_reviewer_financial_request_state.dart';


class  GetReviewerFinancialRequestCubit extends Cubit< GetReviewerFinancialRequestState>{
  GetReviewerFinancialRequestCubit({required this.getReviewerFinancialRequestUseCase}):super(GetReviewerFinancialRequestState());
  GetReviewerFinancialRequestUseCase  getReviewerFinancialRequestUseCase  ;

  getReviewerFinancialRequest() async {

    emit(state.copyWith(isLoading: true));
    final response = await getReviewerFinancialRequestUseCase();
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

