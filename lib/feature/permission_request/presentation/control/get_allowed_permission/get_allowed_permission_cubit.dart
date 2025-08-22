import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_allowed_permission_use_case.dart';
import '../../../domain/use_case/get_permission_use_case.dart';
import 'get_allowed_permission_state.dart';

class GetAllowedPerMissionRequestCubit extends Cubit<GetAllowedPerMissionRequestState> {
  GetAllowedPerMissionRequestCubit({required this.getUseCase}) : super(GetAllowedPerMissionRequestState());

  GetAllowedPermissionUseCase  getUseCase  ;

  getAllowedPerMission() async {

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
