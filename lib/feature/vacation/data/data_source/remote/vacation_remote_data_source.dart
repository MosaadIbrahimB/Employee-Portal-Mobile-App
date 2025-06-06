import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/request_default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/response_post_vacation_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/vacation_type_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';

abstract class VacationRemoteDataSource {
  Future<List<VacationTypeModel>> getVacationType();

  Future<List<DefaultReviewerModel>> getDefaultReviewer({
    required RequestDefaultReviewerModel requestDefaultReviewerModel,
  });




  Future<ResponsePostVacationModel> postVacation({
    required PostVacationModel postVacationModel,
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
}
