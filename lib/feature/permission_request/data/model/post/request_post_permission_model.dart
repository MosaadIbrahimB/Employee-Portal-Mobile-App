import '../../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';
import '../../../../vacation/data/model/post_vacation/post_vacation_request_model.dart';

class RequestPostPermissionModel {
  String? fromDate;
  String? toDate;
  int? permissionType;
  String? notes;
  RequestModel? request;

  RequestPostPermissionModel(
      {this.fromDate,
        this.toDate,
        this.permissionType,
        this.notes,
        this.request});

  RequestPostPermissionModel.fromJson(Map<String, dynamic> json) {
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    permissionType = json['permissionType'];
    notes = json['notes'];
    request =
    json['request'] != null ? new RequestModel.fromJson(json['request']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['permissionType'] = this.permissionType;
    data['notes'] = this.notes;
    if (this.request != null) {
      data['request'] = this.request!.toJson();
    }
    return data;
  }
}
