import '../../model/alert_model.dart';
import '../../model/post/request_post_over_time_model.dart';
import '../../model/post/response_post_over_time_model.dart';
import '../../model/request_alert_model.dart';
import '../../model/response_over_time_model.dart';
abstract class OverTimeRequestRemoteDataSource {

  Future<List<ResponseOverTimeModel>> getEmployeeOverTimeRequest();
  Future<List<ResponseOverTimeModel>> getReviewerOverTimeRequest();
  Future<ResponsePostOverTimeModel> postOverTimeRequest({
    required  RequestPostOverTimeModel requestPostOverTimeModel,
  });

  Future<AlertModel>getAlertOverTimeRequest({
   required RequestAlertModel  requestAlertModel,
     int ?id,

  });
  Future<List<AlertModel>>getAlertsOverTimeRequest(
      { required RequestAlertModel requestAlertModel}
      );
}
