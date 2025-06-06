import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class CalculateVacationDurationUseCase{
  VacationRepository vacationRepository;

  CalculateVacationDurationUseCase(this.vacationRepository);

  Future<Either<Failure, CalculateVacationDurationResponseModel>>call(
      CalculateVacationDurationRequestModel calculateVacationDurationRequestModel) async {
    return await vacationRepository.calculateVacationDuration(calculateVacationDurationRequestModel);
  }
}