import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_permission_use_case.dart';
import 'get_permission_request_state.dart';

class GetPerMissionRequestCubit extends Cubit<GetPerMissionRequestState> {
  GetPerMissionRequestCubit({required this.getUseCase}) : super(GetPerMissionRequestState());

  GetPerMissionUseCase  getUseCase  ;

  getPerMission() async {

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
