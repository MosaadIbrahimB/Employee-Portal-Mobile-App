import '../../../../../core/utils/import_file.dart';
import '../../../domain/use_case/get_employee_mission_request_use_case.dart';
import 'get_employee_mission_state.dart';

class GetEmployeeMissionCubit extends Cubit<GetEmployeeMissionRequestState> {
  GetEmployeeMissionCubit({required this.getEmployeeMissionUseCase}) : super(GetEmployeeMissionRequestState());

GetEmployeeMissionUseCase  getEmployeeMissionUseCase  ;

  getEmployeeMission() async {

    emit(state.copyWith(isLoading: true));
    final response = await getEmployeeMissionUseCase();
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
