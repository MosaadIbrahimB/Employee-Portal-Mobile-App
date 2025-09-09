import '../../model/alert_model.dart';
import '../../model/post/request_post_over_time_model.dart';
import '../../model/post/response_post_over_time_model.dart';
import '../../model/response_over_time_model.dart';
import '../../model/type_over_time_model.dart';
abstract class OverTimeRequestRemoteDataSource {
  Future<List<TypeOverTimeModel>> getTypeOverTime();

  Future<List<ResponseOverTimeModel>> getEmployeeOverTimeRequest();
  Future<List<ResponseOverTimeModel>> getReviewerOverTimeRequest();
  Future<List<ResponsePostOverTimeModel>> postOverTimeRequest({
    required  RequestPostOverTimeModel requestPostOverTimeModel,
  });

  Future<AlertModel>getAlertOverTimeRequest({
     int ?id,
  });
  Future<List<AlertModel>>getAlertsOverTimeRequest(
      {
        String? fromDate,
        String? toDate,}
      );
}
