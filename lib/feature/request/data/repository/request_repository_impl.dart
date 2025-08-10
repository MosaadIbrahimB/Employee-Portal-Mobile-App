import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/mission_model/response_get_mission_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/mission_model/response_get_review_mission_request_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/request_post_administrative_request_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/response_admin_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/request/data/model/response_post_administrative_request.dart';
import 'package:employee_portal_mobile_app/feature/request/domain/repository/request_repository.dart';

import '../data_source/remote/request_remote_data_source.dart';

class RequestRepositoryImpl implements RequestRepository {
  RequestRemoteDataSource requestRemoteDataSource;

  RequestRepositoryImpl({required this.requestRemoteDataSource});
//Admin
  @override
  Future<Either<Failure, List<FinancialRequestTypeModel>>> getAdminRequestType()
  async {
    try {
      final result = await requestRemoteDataSource.getAdminRequestType();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getVacationType  "),
      );
    }
  }

  @override
  Future<Either<Failure,
      List<
          ResponseAdminFinancialModel>>> getEmployeeAdministrativeRequest() async {
    try {
      final result = await requestRemoteDataSource
          .getEmployeeAdministrativeRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم getEmployeeReviewedAdministrativeRequest  "),
      );
    }
  }

  @override
  Future<Either<Failure,
      List<
          ResponseAdminFinancialModel>>> getReviewerAdministrativeRequest() async {
    try {
      final result = await requestRemoteDataSource
          .getReviewerAdministrativeRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم getReviewerAdministrativeRequest  "),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsePostAdministrativeFinancialRequest>> postAdministrativeFinancialRequest({required RequestPostAdministrativeFinancialRequestModel requestPostAdministrativeRequestModel})
  async {
    try {
      final result = await requestRemoteDataSource
          .postAdministrativeRequest(requestPostAdministrativeRequestModel: requestPostAdministrativeRequestModel);
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم postAdministrativeRequest  "),
      );
    }
  }

//Financial
  @override
  Future<Either<Failure, List<FinancialRequestTypeModel>>> getFinancialRequestType() async {
    try {
      final result = await requestRemoteDataSource.getFinancialRequestType();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getVacationType  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponseAdminFinancialModel>>> getEmployeeFinancialRequest()
  async {
    try {
      final result = await requestRemoteDataSource
          .getEmployeeFinancialRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم getEmployeeReviewedAdministrativeRequest  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponseAdminFinancialModel>>> getReviewerFinancialRequest()
  async {
    try {
      final result = await requestRemoteDataSource
          .getReviewerFinancialRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم getReviewerAdministrativeRequest  "),
      );
    }
  }

  // mission

  @override
  Future<Either<Failure, List<ResponseGetMissionModel>>> getMission()
  async {
    try {
      final result = await requestRemoteDataSource
          .getMission();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم getEmployeeMissionRequests  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponseGetReviewMissionRequestModel>>> getEmployeeMissionRequests()
  async {
    try {
      final result = await requestRemoteDataSource
          .getEmployeeMissionRequests();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم getEmployeeMissionRequests  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponseGetReviewMissionRequestModel>>> getReviewerMissionRequests()
  async {
    try {
      final result = await requestRemoteDataSource
          .getReviewerMissionRequests();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم getReviewerMissionRequests  "),
      );
    }
  }





}

class MissionRequestRepositoryImpl implements RequestRepository {
  final RequestRemoteDataSource requestRemoteDataSource;

  MissionRequestRepositoryImpl({required this.requestRemoteDataSource});

  @override
  Future<Either<Failure, List<ResponseGetMissionModel>>> getMission() async {
    try {
      final result = await requestRemoteDataSource.getMission();
      return right(result);
    } catch (e) {
      return left(ServerFailure("${e.toString()} حدث خطأ في الخادم getMission"));
    }
  }

  @override
  Future<Either<Failure, List<ResponseGetReviewMissionRequestModel>>> getEmployeeMissionRequests() async {
    try {
      final result = await requestRemoteDataSource.getEmployeeMissionRequests();
      return right(result);
    } catch (e) {
      return left(ServerFailure("${e.toString()} حدث خطأ في الخادم getEmployeeMissionRequests"));
    }
  }

  @override
  Future<Either<Failure, List<ResponseGetReviewMissionRequestModel>>> getReviewerMissionRequests() async {
    try {
      final result = await requestRemoteDataSource.getReviewerMissionRequests();
      return right(result);
    } catch (e) {
      return left(ServerFailure("${e.toString()} حدث خطأ في الخادم getReviewerMissionRequests"));
    }
  }

  // ↓ مش هننفذ الباقي هنا لأنهم خاصين بـ Admin & Financial
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
