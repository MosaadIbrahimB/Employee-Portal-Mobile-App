
import '../../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';

class RequestPostMissionModel {
  String? destination;
  String? from;
  String? to;
  int? duration;
  int? unit;
  String? notes;
  Request? request;

  RequestPostMissionModel(
      {this.destination,
        this.from,
        this.to,
        this.duration,
        this.unit,
        this.notes,
        this.request});

  RequestPostMissionModel.fromJson(Map<String, dynamic> json) {
    destination = json['destination'];
    from = json['from'];
    to = json['to'];
    duration = json['duration'];
    unit = json['unit'];
    notes = json['notes'];
    request =
    json['request'] != null ?  Request.fromJson(json['request']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination'] = destination;
    data['from'] = from;
    data['to'] = to;
    data['duration'] = duration;
    data['unit'] = unit;
    data['notes'] = notes;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    return data;
  }
}

class Request {
  List<DefaultReviewerModel>? reviewers;

  Request({this.reviewers});

  Request.fromJson(Map<String, dynamic> json) {
    if (json['reviewers'] != null) {
      reviewers = <DefaultReviewerModel>[];
      json['reviewers'].forEach((v) {
        reviewers!.add( DefaultReviewerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviewers != null) {
      data['reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

