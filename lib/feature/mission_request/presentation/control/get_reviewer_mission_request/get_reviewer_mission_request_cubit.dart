import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_reviewer_mission_request_use_case.dart';
import 'get_reviewer_mission_request_state.dart';


class  GetReviewerMissionRequestCubit extends Cubit< GetReviewerMissionRequestState>{
  GetReviewerMissionRequestCubit({required this.getReviewerMissionUseCase}):super(GetReviewerMissionRequestState());
  GetReviewerMissionUseCase  getReviewerMissionUseCase  ;

  getReviewerMissionRequest() async {

    emit(state.copyWith(isLoading: true));
    final response = await getReviewerMissionUseCase();
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

