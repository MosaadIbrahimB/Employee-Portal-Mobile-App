import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/check_handled_alerts_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/check_handled_alerts/check_handled_alerts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckHandledAlertsCubit extends Cubit<CheckHandledAlertsState> {
  final CheckHandledAlertsUseCase useCase;

  CheckHandledAlertsCubit(this.useCase) : super(const CheckHandledAlertsState());

  Future<void> checkAlerts(CheckHandledAlertsRequestModel requestModel) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await useCase(requestModel);
    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: "فشل في الاتصال بالخادم")),
          (response) => emit(state.copyWith(isLoading: false, response: response)),
    );
  }
}
