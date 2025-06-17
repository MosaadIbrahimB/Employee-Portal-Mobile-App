import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class GetEmployeeVacationsUseCase {
  final VacationRepository vacationRepository;

  GetEmployeeVacationsUseCase(this.vacationRepository);

  Future<Either<Failure, List<GetEmployeeVacationsModel>>> call() async {
    return await vacationRepository.getEmployeeVacations();
  }
}
