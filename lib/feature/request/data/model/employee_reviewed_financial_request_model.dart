class EmployeeReviewedFinancialRequestModel {
  String? requestDate;
  String? requestTypeName;
  String? date;
  double? value;
  String? notes;
  bool? editable;
  String? attachments;
  String? status;
  List<Reviewers>? reviewers;

  EmployeeReviewedFinancialRequestModel(
      {this.requestDate,
        this.requestTypeName,
        this.date,
        this.value,
        this.notes,
        this.editable,
        this.attachments,
        this.status,
        this.reviewers});

  EmployeeReviewedFinancialRequestModel.fromJson(Map<String, dynamic> json) {
    requestDate = json['RequestDate'];
    requestTypeName = json['RequestTypeName'];
    date = json['Date'];
    value = json['Value'];
    notes = json['Notes'];
    editable = json['Editable'];
    attachments = json['Attachments'];
    status = json['Status'];
    if (json['Reviewers'] != null) {
      reviewers = <Reviewers>[];
      json['Reviewers'].forEach((v) {
        reviewers!.add(Reviewers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestDate'] = requestDate;
    data['RequestTypeName'] = requestTypeName;
    data['Date'] = date;
    data['Value'] = value;
    data['Notes'] = notes;
    data['Editable'] = editable;
    data['Attachments'] = attachments;
    data['Status'] = status;
    if (reviewers != null) {
      data['Reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviewers {
  String? name;
  String? status;
  String? note;

  Reviewers({this.name, this.status, this.note});

  Reviewers.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    status = json['Status'];
    note = json['Note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Status'] = status;
    data['Note'] = note;
    return data;
  }
}
