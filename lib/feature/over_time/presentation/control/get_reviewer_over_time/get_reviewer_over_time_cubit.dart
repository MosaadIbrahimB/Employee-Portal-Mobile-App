import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domin/use_case/get_reviewer_over_time_use_case.dart';
import 'get_reviewer_over_time_state.dart';

class GetReviewerOverTimeCubit extends Cubit<GetReviewerOverTimeState> {
  GetReviewerOverTimeCubit({required this.getReviewerOverTimeUseCase})
    : super(GetReviewerOverTimeState());
  GetReviewerOverTimeUseCase getReviewerOverTimeUseCase;

  getReviewerOverTime() async {
    emit(state.copyWith(isLoading: true));
    final response = await getReviewerOverTimeUseCase();
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
