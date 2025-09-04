class AlertModel {
  int? id;
  String? date;
  int? duration;
  String? notes;

  AlertModel({this.id, this.date, this.duration, this.notes});

  AlertModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    duration = json['duration'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['duration'] = duration;
    data['notes'] = notes;
    return data;
  }
}
