import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/alert_model.dart';
import '../../../domin/use_case/get_alerts_over_time_use_case.dart';
import 'get_alerts_over_time_state.dart';

class GetAlertsOverTimeCubit extends Cubit<GetAlertsOverTimeState> {
  GetAlertsOverTimeCubit({required this.getAlertsOverTimeUseCase})
    : super(GetAlertsOverTimeState());
  GetAlertsOverTimeUseCase getAlertsOverTimeUseCase;

  getAlertOverTime(String?fromDate,String?toDate) async {
    emit(state.copyWith(isLoading: true));
    final response = await getAlertsOverTimeUseCase(fromDate: fromDate,toDate: toDate);
    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (resulte) {
        emit(state.copyWith(isLoading: false, response: resulte));
      },
    );
  }

  void selectAlert(AlertModel alert) {
    final current = List<AlertModel>.from(state.listOverTimeSelected ?? []);
    if (!current.contains(alert)) {
      current.add(alert);
      emit(state.copyWith(listOverTimeSelected: current));
    }
  }

  void unselectAlert(AlertModel alert) {
    final current = List<AlertModel>.from(state.listOverTimeSelected ?? []);
    current.remove(alert);
    emit(state.copyWith(listOverTimeSelected: current));
  }

  void toggleAlertSelection(AlertModel alert, bool isSelected) {
    if (isSelected) {
      selectAlert(alert);
    } else {
      unselectAlert(alert);
    }
  }

}
