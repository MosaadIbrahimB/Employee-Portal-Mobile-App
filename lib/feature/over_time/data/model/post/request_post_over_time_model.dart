import 'package:employee_portal_mobile_app/feature/over_time/data/model/post/request_of_post_over_time_model.dart';
import '../alert_model.dart';


class RequestPostOverTimeModel {
  RequestOfPostOverTimeModel? request;
  List<AlertModel>? alerts;

  RequestPostOverTimeModel({this.request, this.alerts});

  RequestPostOverTimeModel.fromJson(Map<String, dynamic> json) {
    request =
    json['request'] != null ? RequestOfPostOverTimeModel.fromJson(json['request']) : null;
    if (json['alerts'] != null) {
      alerts = <AlertModel>[];
      json['alerts'].forEach((v) {
        alerts!.add(AlertModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (request != null) {
      data['request'] = request!.toJson();
    }
    if (alerts != null) {
      data['alerts'] = alerts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


