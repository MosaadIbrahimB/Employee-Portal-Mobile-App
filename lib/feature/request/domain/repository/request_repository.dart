import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';

abstract class RequestRepository {
  Future<Either<Failure, List<FinancialRequestTypeModel>>> getFinancialRequestType();



}
