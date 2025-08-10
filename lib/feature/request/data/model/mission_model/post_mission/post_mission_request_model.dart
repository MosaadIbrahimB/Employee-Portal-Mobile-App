import '../reviewer_mission_model.dart';

class PostMissionRequestModel {
  String? destination;
  String? from;
  String? to;
  int? duration;
  int? unit;
  String? notes;
  Request? request;

  PostMissionRequestModel(
      {this.destination,
        this.from,
        this.to,
        this.duration,
        this.unit,
        this.notes,
        this.request});

  PostMissionRequestModel.fromJson(Map<String, dynamic> json) {
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
  List<ReviewerMissionModel>? reviewers;

  Request({this.reviewers});

  Request.fromJson(Map<String, dynamic> json) {
    if (json['reviewers'] != null) {
      reviewers = <ReviewerMissionModel>[];
      json['reviewers'].forEach((v) {
        reviewers!.add( ReviewerMissionModel.fromJson(v));
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

