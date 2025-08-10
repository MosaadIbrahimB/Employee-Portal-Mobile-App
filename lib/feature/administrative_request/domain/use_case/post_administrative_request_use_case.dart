import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/request_post_administrative_request_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/domain/repository/administrative_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/response_post_administrative_request.dart';

class PostAdministrativeRequestUseCase {
  AdministrativeRequestRepository repository;


  PostAdministrativeRequestUseCase({required this.repository});


  Future<Either<Failure, ResponsePostAdministrativeRequest>> call({
    required RequestPostAdministrativeRequestModel requestPostAdministrativeRequestModel,
  })
  async {
    return await repository.postAdministrativeRequest(requestPostAdministrativeRequestModel: requestPostAdministrativeRequestModel);
  }

}
