import 'package:employee_portal_mobile_app/feature/mission/data/model/reviewer_mission_model.dart';

class ResponseGetReviewMissionRequestModel {
  String? requestDate;
  String? from;
  String? to;
  String? destination;
  String? duration;
  String? notes;
  String? attachments;
  bool? editable;
  String? status;
  List<ReviewerMissionModel>? reviewers;

  ResponseGetReviewMissionRequestModel(
      {this.requestDate,
        this.from,
        this.to,
        this.destination,
        this.duration,
        this.notes,
        this.attachments,
        this.editable,
        this.status,
        this.reviewers});

  ResponseGetReviewMissionRequestModel.fromJson(Map<String, dynamic> json) {
    requestDate = json['RequestDate'];
    from = json['From'];
    to = json['To'];
    destination = json['Destination'];
    duration = json['Duration'];
    notes = json['Notes'];
    attachments = json['Attachments'];
    editable = json['Editable'];
    status = json['Status'];
    if (json['Reviewers'] != null) {
      reviewers = <ReviewerMissionModel>[];
      json['Reviewers'].forEach((v) {
        reviewers!.add( ReviewerMissionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestDate'] = requestDate;
    data['From'] = from;
    data['To'] = to;
    data['Destination'] = destination;
    data['Duration'] = duration;
    data['Notes'] = notes;
    data['Attachments'] = attachments;
    data['Editable'] = editable;
    data['Status'] = status;
    if (reviewers != null) {
      data['Reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

