import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_employee_permission_request_use_case.dart';
import 'get_employee_permission_state.dart';

class GetEmployeePerMissionRequestCubit extends Cubit<GetEmployeePerMissionRequestState> {
  GetEmployeePerMissionRequestCubit({required this.getUseCase}) : super(GetEmployeePerMissionRequestState());

  GetEmployeePermissionRequestUseCase  getUseCase  ;

  getEmployeePerMission() async {

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
