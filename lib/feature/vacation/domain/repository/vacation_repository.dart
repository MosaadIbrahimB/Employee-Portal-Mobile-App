import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/request_default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/response_post_vacation_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/entity/vacation_type_entity.dart';

abstract class VacationRepository {
  Future<Either<Failure, List<VacationTypeEntity>>> getVacationType();

  Future<Either<Failure, List<DefaultReviewerModel>>> getDefaultReviewer(
      {required RequestDefaultReviewerModel requestDefaultReviewerModel}
      );

  Future<Either<Failure,ResponsePostVacationModel>> postVacation({
    required PostVacationModel postVacationModel,
  });

  Future<Either<Failure,CalculateVacationDurationResponseModel>> calculateVacationDuration(
      CalculateVacationDurationRequestModel calculateVacationDurationRequestModel,
      );

  Future<Either<Failure, ValidateVacationResponseModel>> validateVacation({
    required ValidateVacationRequestModel requestModel,
  });

  Future<Either<Failure, CheckHandledAlertsResponseModel>> checkHandledAlerts({
    required CheckHandledAlertsRequestModel requestModel,
  });



}
