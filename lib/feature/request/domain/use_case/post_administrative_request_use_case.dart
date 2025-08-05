import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/request/domain/repository/request_repository.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

import '../../data/model/financial_request_type_model.dart';
import '../../data/model/request_post_administrative_request_model.dart';
import '../../data/model/response_post_administrative_request.dart';

class PostAdministrativeFinancialRequestUseCase {
  RequestRepository requestRepository;


  PostAdministrativeFinancialRequestUseCase({required this.requestRepository});


  Future<Either<Failure, ResponsePostAdministrativeFinancialRequest>> call({required RequestPostAdministrativeFinancialRequestModel requestPostAdministrativeFinancialRequestModel})
  async {
    return await requestRepository.postAdministrativeFinancialRequest(requestPostAdministrativeRequestModel: requestPostAdministrativeFinancialRequestModel);
  }

}
