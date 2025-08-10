import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/repository/financial_repository.dart';

import '../../data/model/financial_request_type_model.dart';

class GetFinancialRequestTypeUseCase {
  FinancialRequestRepository repository;

  GetFinancialRequestTypeUseCase({required this.repository});

  Future<Either<Failure, List<FinancialRequestTypeModel>>>
  call() async {
   return await repository.getFinancialRequestType();
  }

}
