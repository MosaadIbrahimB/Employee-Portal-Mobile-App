import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class ValidateVacationUseCase {
  final VacationRepository vacationRepository;

  ValidateVacationUseCase(this.vacationRepository);

  Future<Either<Failure, ValidateMissionResponseModel>> call(
    ValidateVacationRequestModel requestModel,
  ) async {
    return await vacationRepository.validateVacation(
      requestModel: requestModel,
    );
  }
}
