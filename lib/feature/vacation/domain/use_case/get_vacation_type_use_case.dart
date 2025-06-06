import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/entity/vacation_type_entity.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class GetVacationTypeUseCase {
  VacationRepository vacationRepository;

  GetVacationTypeUseCase(this.vacationRepository);

  Future<Either<Failure, List<VacationTypeEntity>>> call() async {
    return await vacationRepository.getVacationType();
  }


}
