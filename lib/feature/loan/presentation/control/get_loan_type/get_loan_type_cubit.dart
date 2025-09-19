import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_loan_type_use_case.dart';
import 'get_loan_type_state.dart';

class GetLoanTypeCubit extends Cubit<GetLoanTypeState> {
  GetLoanTypeCubit({required this.getLoanTypeUseCase})
    : super(GetLoanTypeState());
  GetLoanTypeUseCase getLoanTypeUseCase;

  getLoanType() async {
    emit(state.copyWith(isLoading: true));
    final response = await getLoanTypeUseCase();
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
