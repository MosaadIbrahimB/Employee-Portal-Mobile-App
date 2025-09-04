import '../../../../mission_request/data/model/post_mission/post_mission_request_model.dart';
import '../alert_model.dart';

class RequestPostOverTimeModel {
  Request? request;
  List<AlertModel>? alerts;

  RequestPostOverTimeModel({this.request, this.alerts});

  RequestPostOverTimeModel.fromJson(Map<String, dynamic> json) {
    request =
    json['request'] != null ? Request.fromJson(json['request']) : null;
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



