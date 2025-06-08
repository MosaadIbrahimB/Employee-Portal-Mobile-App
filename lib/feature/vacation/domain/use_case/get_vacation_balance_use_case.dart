import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_vacation_balance/vacation_balance_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_vacation_balance/vacation_balance_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';


class GetVacationBalanceUseCase {
  final VacationRepository repository;

  GetVacationBalanceUseCase(this.repository);

  Future<Either<Failure, VacationBalanceResponseModel>> call({
    required VacationBalanceRequestModel requestModel,
  }) {
    return repository.getVacationBalance(requestModel: requestModel);
  }
}
