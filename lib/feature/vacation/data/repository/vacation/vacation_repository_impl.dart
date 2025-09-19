import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/core/error/exceptions.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/data_source/remote/vacation_remote_data_source.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/approve_cancel/approve_cancel_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_vacation_balance/vacation_balance_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_vacation_balance/vacation_balance_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_vacation_requests/get_vacation_requests_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/vacation_type/vacation_type_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

import '../../model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

class VacationRepositoryImpl implements VacationRepository {
  final VacationRemoteDataSource vacationRemoteDataSource;

  VacationRepositoryImpl({required this.vacationRemoteDataSource});

  @override
  Future<Either<Failure, List<VacationTypeModel>>> getVacationType() async {
    try {
      final result = await vacationRemoteDataSource.getVacationType();
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (e) {
      return left(ServerFailure("حدث خطأ غير متوقع في getVacationType"));
    }
  }

  @override
  Future<Either<Failure, List<DefaultReviewerModel>>> getDefaultReviewer({
    required RequestDefaultReviewerModel requestDefaultReviewerModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.getDefaultReviewer(
        requestDefaultReviewerModel: requestDefaultReviewerModel,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (e) {
      return left(ServerFailure("حدث خطأ غير متوقع في getDefaultReviewer"));
    }
  }

  @override
  Future<Either<Failure, PostVacationResponseModel>> postVacation({
    required PostVacationRequestModel postVacationModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.postVacation(
        postVacationModel: postVacationModel,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (_) {
      return left(ServerFailure("حدث خطأ غير متوقع في postVacation"));
    }
  }

  @override
  Future<Either<Failure, CalculateVacationDurationResponseModel>>
  calculateVacationDuration(
      CalculateVacationDurationRequestModel calculateVacationDurationRequestModel,
      ) async {
    try {
      final result =
      await vacationRemoteDataSource.calculateVacationDuration(
        calculateVacationDurationRequestModel,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (_) {
      return left(ServerFailure("حدث خطأ غير متوقع في calculateVacationDuration"));
    }
  }

  @override
  Future<Either<Failure, ValidateMissionResponseModel>> validateVacation({
    required ValidateVacationRequestModel requestModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.validateVacation(
        requestModel: requestModel,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (_) {
      return left(ServerFailure("حدث خطأ غير متوقع في validateVacation"));
    }
  }

  @override
  Future<Either<Failure, CheckHandledAlertsResponseModel>> checkHandledAlerts({
    required CheckHandledAlertsRequestModel requestModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.checkHandledAlerts(
        requestModel: requestModel,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (_) {
      return left(ServerFailure("حدث خطأ غير متوقع في checkHandledAlerts"));
    }
  }

  @override
  Future<Either<Failure, VacationBalanceResponseModel>> getVacationBalance({
    required VacationBalanceRequestModel requestModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.getVacationBalance(
        requestModel: requestModel,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (_) {
      return left(ServerFailure("حدث خطأ غير متوقع في getVacationBalance"));
    }
  }

  @override
  Future<Either<Failure, List<GetEmployeeVacationsResponseModel>>>
  getEmployeeVacations() async {
    try {
      final result = await vacationRemoteDataSource.getEmployeeVacations();
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (_) {
      return left(ServerFailure("حدث خطأ غير متوقع في getEmployeeVacations"));
    }
  }

  @override
  Future<Either<Failure, List<GetVacationRequestsResponseModel>>>
  getVacationRequests() async {
    try {
      final result = await vacationRemoteDataSource.getVacationRequests();
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (_) {
      return left(ServerFailure("حدث خطأ غير متوقع في getVacationRequests"));
    }
  }

  @override
  Future<Either<Failure, bool>> approveCancelRequest({
    required ApproveCancelRequestModel approveCancelRequestModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.approveCancelRequest(
        approveCancelRequestModel: approveCancelRequestModel,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "حدث خطأ في الخادم"));
    } catch (_) {
      return left(ServerFailure("حدث خطأ غير متوقع في approveCancelRequest"));
    }
  }
}
