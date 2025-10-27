import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/data_source/remote/administrative_request_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/request_post_administrative_request_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_administrative_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/response_post_administrative_request.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/domain/repository/administrative_repository.dart';

class AdministrativeRequestRepositoryImpl implements AdministrativeRequestRepository {
  AdministrativeRequestRemoteDataSource administrativeRequestRemoteDataSource;

  AdministrativeRequestRepositoryImpl({
    required this.administrativeRequestRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<AdministrativeRequestTypeModel>>> getAdministrativeRequestType()
  async {
    try {
      final result =
          await administrativeRequestRemoteDataSource
              .getAdministrativeRequestType();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getAdministrativeRequestType  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponseAdministrativeModel>>> getEmployeeAdministrativeRequest()
  async {
    try {
      final result =
      await administrativeRequestRemoteDataSource.getEmployeeAdministrativeRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          "${e.toString()}حدث خطأ في الخادم getEmployeeAdministrativeRequest  ",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponseAdministrativeModel>>> getReviewerAdministrativeRequest()
  async {
    try {
      final result =
      await administrativeRequestRemoteDataSource.getReviewerAdministrativeRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          "${e.toString()}حدث خطأ في الخادم getReviewerAdministrativeRequest  ",
        ),
      );
    }
  }


  @override
  Future<Either<Failure, ResponsePostAdministrativeRequest>> postAdministrativeRequest({required RequestPostAdministrativeRequestModel requestPostAdministrativeRequestModel})
  async {
    try {
      final result = await administrativeRequestRemoteDataSource
          .postAdministrativeRequest(requestPostAdministrativeRequestModel: requestPostAdministrativeRequestModel);
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم postAdministrativeRequest  "),
      );
    }
  }







}
