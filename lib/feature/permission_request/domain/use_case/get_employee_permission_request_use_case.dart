import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/response_permission_request_model.dart';
import '../repository/permission_repository.dart';



class GetEmployeePermissionRequestUseCase {
  PerMissionRequestRepository repository;

  GetEmployeePermissionRequestUseCase({required this.repository});

  Future<Either<Failure, List<ResponsePermissionRequestModel>>> call() async {
    return await repository.getEmployeePermissionRequest();
  }
}
