import '../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';

class RequestModel {
  int? requestType;
  String? date;
  int? value;
  List<DefaultReviewerModel>? reviewers;

  RequestModel({this.requestType, this.date, this.value, this.reviewers});

  RequestModel.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    date = json['date'];
    value = json['value'];
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
    data['value'] = value;
    if (reviewers != null) {
      data['reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
