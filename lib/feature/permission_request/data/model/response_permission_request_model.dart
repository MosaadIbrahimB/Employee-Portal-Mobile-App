import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';

class ResponsePermissionRequestModel {
  String? requestDate;
  String? from;
  String? to;
  int? duration;
  String? notes;
  String? permissionTypeName;
  String? attachments;
  bool? editable;
  String? status;
  List<DefaultReviewerModel>? reviewers;

 


  ResponsePermissionRequestModel(
      {this.requestDate,
        this.from,
        this.to,
        this.duration,
        this.notes,
        this.permissionTypeName,
        this.attachments,
        this.editable,
        this.status,
        this.reviewers});

  ResponsePermissionRequestModel.fromJson(Map<String, dynamic> json) {
    requestDate = json['RequestDate'];
    from = json['From'];
    to = json['To'];
    duration = json['Duration'];
    notes = json['Notes'];
    permissionTypeName = json['PermissionTypeName'];
    attachments = json['Attachments'];
    editable = json['Editable'];
    status = json['Status'];
    if (json['Reviewers'] != null) {
      reviewers = <DefaultReviewerModel>[];
      json['Reviewers'].forEach((v) {
        reviewers!.add(DefaultReviewerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestDate'] = requestDate;
    data['From'] = from;
    data['To'] = to;
    data['Duration'] = duration;
    data['Notes'] = notes;
    data['PermissionTypeName'] = permissionTypeName;
    data['Attachments'] = attachments;
    data['Editable'] = editable;
    data['Status'] = status;
    if (reviewers != null) {
      data['Reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

