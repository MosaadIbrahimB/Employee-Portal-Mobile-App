import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/use_case/get_alert_over_time_use_case.dart';
import 'get_alert_over_time_state.dart';

class GetAlertOverTimeCubit extends Cubit<GetAlertOverTimeState> {
  GetAlertOverTimeCubit({required this.getAlertOverTimeUseCase})
    : super(GetAlertOverTimeState());
  GetAlertOverTimeUseCase getAlertOverTimeUseCase;

  getAlertOverTime(int? id) async {
    emit(state.copyWith(isLoading: true));
    final response = await getAlertOverTimeUseCase(id: id);
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
