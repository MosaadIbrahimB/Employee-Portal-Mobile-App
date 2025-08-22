import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_reviewer_permission_use_case.dart';
import 'get_reviewer_permission_state.dart';

class GetReviewerPerMissionRequestCubit extends Cubit<GetReviewerPerMissionRequestState> {
  GetReviewerPerMissionRequestCubit({required this.getUseCase}) : super(GetReviewerPerMissionRequestState());

  GetReviewerPermissionUseCase  getUseCase  ;

  getReviewerPerMission() async {

    emit(state.copyWith(isLoading: true));
    final response = await getUseCase();
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
