import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_vacation_balance/vacation_balance_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_vacation_balance/vacation_balance_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/vacation_type/vacation_type_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';

import '../../model/get_employee_vacations_model/get_employee_vacations_model.dart';

abstract class VacationRemoteDataSource {
  Future<List<VacationTypeModel>> getVacationType();
  Future<List<DefaultReviewerModel>> getDefaultReviewer({
    required RequestDefaultReviewerModel requestDefaultReviewerModel,
  });
  Future<PostVacationResponseModel> postVacation({
    required PostVacationRequestModel postVacationModel,
  });
  Future<CalculateVacationDurationResponseModel> calculateVacationDuration(
    CalculateVacationDurationRequestModel calculateVacationDurationRequestModel,
  ) ;
  Future<ValidateVacationResponseModel> validateVacation({
    required ValidateVacationRequestModel requestModel,
  });
  Future<CheckHandledAlertsResponseModel> checkHandledAlerts({
    required CheckHandledAlertsRequestModel requestModel,
  });
  Future<VacationBalanceResponseModel> getVacationBalance({
    required VacationBalanceRequestModel requestModel,
  });
  Future<List<GetEmployeeVacationsModel>> getEmployeeVacations();
}
