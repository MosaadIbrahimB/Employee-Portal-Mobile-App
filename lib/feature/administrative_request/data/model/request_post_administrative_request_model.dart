
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_reviewer_model.dart';

import '../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';

class RequestPostAdministrativeRequestModel {
  int? requestType;
  String? date;
  String? notes;
  String? attachments;
  List<DefaultReviewerModel>? reviewers;

  RequestPostAdministrativeRequestModel(
      {this.requestType,
        this.date,
        this.notes,
        this.attachments,
        this.reviewers});

  RequestPostAdministrativeRequestModel.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    date = json['date'];
    notes = json['notes'];
    attachments = json['attachments'];
    if (json['reviewers'] != null) {
      reviewers = <DefaultReviewerModel>[];
      json['reviewers'].forEach((v) {
        reviewers!.add( DefaultReviewerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['date'] = date;
    data['notes'] = notes;
    data['attachments'] = attachments;
    if (reviewers != null) {
      data['reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

