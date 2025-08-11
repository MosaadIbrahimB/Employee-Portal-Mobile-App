import 'package:employee_portal_mobile_app/feature/mission_request/domain/use_case/get_mission_use_case.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/presentation/control/get_mission_request/get_mission_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMissionRequestCubit extends Cubit<GetMissionRequestState> {
  GetMissionRequestCubit({required this.getMissionUseCase}) : super(GetMissionRequestState());

  GetMissionUseCase  getMissionUseCase  ;

  getMission() async {

    emit(state.copyWith(isLoading: true));
    final response = await getMissionUseCase();
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
