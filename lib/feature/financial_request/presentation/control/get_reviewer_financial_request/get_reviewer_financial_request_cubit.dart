import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../financial_request/domain/use_case/get_reviewer_financial_request_use_case.dart';
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

