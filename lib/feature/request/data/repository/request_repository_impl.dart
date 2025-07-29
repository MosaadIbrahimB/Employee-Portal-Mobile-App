import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/request/domain/repository/request_repository.dart';

import '../data_source/remote/request_remote_data_source.dart';

class RequestRepositoryImpl implements RequestRepository {
  RequestRemoteDataSource requestRemoteDataSource;
  RequestRepositoryImpl({required this.requestRemoteDataSource});

  @override
  Future<Either<Failure, List<FinancialRequestTypeModel>>> getFinancialRequestType()
  async {
    try {
      final result = await requestRemoteDataSource.getFinancialRequestType();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getVacationType  "),
      );
    }
  }



  }


