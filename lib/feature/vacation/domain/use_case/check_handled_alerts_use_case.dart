import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class CheckHandledAlertsUseCase {
  final VacationRepository repository;

  CheckHandledAlertsUseCase(this.repository);

  Future<Either<Failure, CheckHandledAlertsResponseModel>> call(
      CheckHandledAlertsRequestModel requestModel,
      ) async {
    return await repository.checkHandledAlerts(requestModel: requestModel);
  }
}
