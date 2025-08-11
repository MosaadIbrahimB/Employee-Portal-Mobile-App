import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/data_source/remote/financial_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/request_post_financial_request_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/repository/financial_repository.dart';

class FinancialRequestRepositoryImpl implements FinancialRequestRepository {
  FinancialRequestRemoteDataSource financialRequestRemoteDataSource;

  FinancialRequestRepositoryImpl({
    required this.financialRequestRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<FinancialRequestTypeModel>>>
  getFinancialRequestType()
  async {
    try {
      final result =
          await financialRequestRemoteDataSource.getFinancialRequestType();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getVacationType  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponseFinancialModel>>>
  getEmployeeFinancialRequest() async {
    try {
      final result =
          await financialRequestRemoteDataSource.getEmployeeFinancialRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          "${e.toString()}حدث خطأ في الخادم getEmployeeReviewedAdministrativeRequest  ",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponseFinancialModel>>>
  getReviewerFinancialRequest()
  async {
    try {
      final result =
          await financialRequestRemoteDataSource.getReviewerFinancialRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          "${e.toString()}حدث خطأ في الخادم getReviewerFinancialRequest  ",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsePostFinancialRequest>> postFinancialRequest({required RequestPostFinancialRequestModel requestPostFinancialRequestModel})
  async {
    try {
      final result = await financialRequestRemoteDataSource
          .postFinancialRequest(requestPostFinancialRequestModel: requestPostFinancialRequestModel);
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم postFinancialRequest  "),
      );
    }
  }

}
