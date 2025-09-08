import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domin/use_case/get_employee_over_time_use_case.dart';
import 'get_employee_over_time_state.dart';

class GetEmployeeOverTimeCubit extends Cubit<GetEmployeeOverTimeState> {
  GetEmployeeOverTimeCubit({required this.getEmployeeOverTimeUseCase})
    : super(GetEmployeeOverTimeState());
  GetEmployeeOverTimeUseCase getEmployeeOverTimeUseCase;

  getEmployeeOverTime() async {
    emit(state.copyWith(isLoading: true));
    final response = await getEmployeeOverTimeUseCase();
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
