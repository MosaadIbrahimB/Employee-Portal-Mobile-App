import '../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';

class RequestAlertModel {
  int? requestType;
  String? date;
  List<DefaultReviewerModel>? reviewers;

  RequestAlertModel({this.requestType, this.date, this.reviewers});

  RequestAlertModel.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    date = json['date'];
    if (json['reviewers'] != null) {
      reviewers = <DefaultReviewerModel>[];
      json['reviewers'].forEach((v) {
        reviewers!.add(DefaultReviewerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['date'] = date;
    if (reviewers != null) {
      data['reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

