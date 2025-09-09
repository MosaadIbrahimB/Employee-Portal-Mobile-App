
class AlertModel {
  double? originalDuration;
  bool? isHandled;
  int? id;
  String? date;
  String? time;
  double? duration;
  String? timeTable;
  int? planDetailId;
  String? type;
  String? transactionType;
  String? alertType;
  String? status;

  String? notes;

  AlertModel(
      {this.originalDuration,
        this.isHandled,
        this.id,
        this.date,
        this.time,
        this.duration,
        this.timeTable,
        this.planDetailId,
        this.type,
        this.transactionType,
        this.alertType,
        this.status,
        this.notes

      });

  AlertModel.fromJson(Map<String, dynamic> json) {
    originalDuration = json['OriginalDuration'];
    isHandled = json['IsHandled'];
    id = json['Id'];
    date = json['Date'];
    time = json['Time'];
    duration = json['Duration'];
    timeTable = json['TimeTable'];
    planDetailId = json['PlanDetailId'];
    type = json['Type'];
    transactionType = json['TransactionType'];
    alertType = json['AlertType'];
    status = json['Status'];
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







