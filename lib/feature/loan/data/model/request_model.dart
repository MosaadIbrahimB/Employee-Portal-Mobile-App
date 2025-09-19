import '../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';

class RequestModel {
  List<DefaultReviewerModel>? reviewers;

  RequestModel({this.reviewers});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      reviewers:
      json['reviewers'] != null
          ? (json['reviewers'] as List)
          .map((i) => DefaultReviewerModel.fromJson(i))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviewers != null) {
      data['reviewers'] =
          reviewers!.map((v) => v.toJsonPostVacation()).toList();
    }
    return data;
  }
}
