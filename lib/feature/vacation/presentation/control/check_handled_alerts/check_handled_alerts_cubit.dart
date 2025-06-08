import 'package:employee_portal_mobile_app/core/service/dependency_injection/package_export.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/check_handled_alerts/check_handled_alerts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckHandledAlertsCubit extends Cubit<CheckHandledAlertsState> {
  final CheckHandledAlertsUseCase useCase;

  CheckHandledAlertsCubit(this.useCase) : super(const CheckHandledAlertsState());

  Future<void> checkAlerts({required CheckHandledAlertsRequestModel checkHandledAlertsRequestModel}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));




    final result = await useCase(checkHandledAlertsRequestModel);
    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
          (response) => emit(state.copyWith(isLoading: false, response: response)),
    );
  }
}
