import '../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';

class ResponseMissionModel {
  String? from;
  String? to;
  String? destination;
  String? duration;
  String? notes;
  String? modifiedBy;
  String? requestDate;
  String? attachments;
  bool? editable;
  String? status;

  List<DefaultReviewerModel>? reviewers;

  ResponseMissionModel(
      {this.from,
        this.to,
        this.destination,
        this.duration,
        this.notes,
        this.modifiedBy,
        this.requestDate,
        this.attachments,
        this.editable,
        this.status,
        this.reviewers

      });

  ResponseMissionModel.fromJson(Map<String, dynamic> json) {
    from = json['From'];
    to = json['To'];
    destination = json['Destination'];
    duration = json['Duration'];
    notes = json['Notes'];
    modifiedBy = json['ModifiedBy'];
    requestDate = json['RequestDate'];
    attachments = json['Attachments'];
    editable = json['Editable'];
    status = json['Status'];
    if (json['Reviewers'] != null) {
      reviewers = <DefaultReviewerModel>[];
      json['Reviewers'].forEach((v) {
        reviewers!.add( DefaultReviewerModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['From'] = from;
    data['To'] = to;
    data['Destination'] = destination;
    data['Duration'] = duration;
    data['Notes'] = notes;
    data['ModifiedBy'] = modifiedBy;
    data['RequestDate'] = requestDate;
    data['Attachments'] = attachments;
    data['Editable'] = editable;
    data['Status'] = status;
    if (reviewers != null) {
      data['Reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  static final List<ResponseMissionModel>listMission = [
    ResponseMissionModel(
        from: "2025-04-07T00:00:00",
        to: "2025-04-08T23:59:59",
        destination: "البنك",
        duration: "2",
        notes: " هذه مأمورية تحتوي على 2 أيام غياب وتم معالجة هذه الأيام ك مأمورية ",
       modifiedBy: "Agent",
      status: "معتمد",
    ),

  ];
}
