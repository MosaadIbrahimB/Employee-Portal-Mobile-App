class GetPermissionsModel {
  String? fromDate;
  String? toDate;
  int? duration;
  String? notes;
  String? modifiedBy;

  GetPermissionsModel(
      {this.fromDate, this.toDate, this.duration, this.notes, this.modifiedBy});

  GetPermissionsModel.fromJson(Map<String, dynamic> json) {
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    duration = json['Duration'];
    notes = json['Notes'];
    modifiedBy = json['ModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FromDate'] = fromDate;
    data['ToDate'] = toDate;
    data['Duration'] = duration;
    data['Notes'] = notes;
    data['ModifiedBy'] = modifiedBy;
    return data;
  }
}
