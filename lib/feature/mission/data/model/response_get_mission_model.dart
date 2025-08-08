class ResponseGetMissionModel {
  String? from;
  String? to;
  String? destination;
  String? duration;
  String? notes;
  String? modifiedBy;

  ResponseGetMissionModel(
      {this.from,
        this.to,
        this.destination,
        this.duration,
        this.notes,
        this.modifiedBy});

  ResponseGetMissionModel.fromJson(Map<String, dynamic> json) {
    from = json['From'];
    to = json['To'];
    destination = json['Destination'];
    duration = json['Duration'];
    notes = json['Notes'];
    modifiedBy = json['ModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['From'] = from;
    data['To'] = to;
    data['Destination'] = destination;
    data['Duration'] = duration;
    data['Notes'] = notes;
    data['ModifiedBy'] = modifiedBy;
    return data;
  }
}
