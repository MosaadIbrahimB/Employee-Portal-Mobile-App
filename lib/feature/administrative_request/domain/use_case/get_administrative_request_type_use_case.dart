import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/domain/repository/administrative_repository.dart';
import '../../../../core/error/failure.dart';

class GetAdministrativeRequestTypeUseCase {
  AdministrativeRequestRepository repository;

  GetAdministrativeRequestTypeUseCase({required this.repository});

  Future<Either<Failure, List<AdministrativeRequestTypeModel>>>
  call() async {
   return await repository.getAdministrativeRequestType();

  }

}
