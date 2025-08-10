import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/domain/repository/administrative_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/response_administrative_model.dart';

class GetEmployeeAdministrativeUseCase {
  AdministrativeRequestRepository repository;

  GetEmployeeAdministrativeUseCase({required this.repository});

  Future<Either<Failure, List<ResponseAdministrativeModel>>> call() async {
    return await repository.getEmployeeAdministrativeRequest();
  }
}
