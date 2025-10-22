
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


 static List<AlertModel>list=[
    AlertModel(
      id: 1,
      date: "2023-10-01",
      duration: 2.0,
      notes: "Worked extra hours on project A",
    ),
    AlertModel(
      id: 2,
      date: "2023-10-02",
      duration: 3.5,
      notes: "Assisted with urgent client request",
    ),
    AlertModel(
      id: 3,
      date: "2023-10-03",
      duration: 1.5,
      notes: "Completed additional documentation",
    ),
   AlertModel(
      id: 4,
      date: "2023-10-04",
      duration: 4.0,
      notes: "Participated in weekend training session",
   ),
    AlertModel(
        id: 5,
        date: "2023-10-05",
        duration: 2.5,
        notes: "Helped team meet tight deadline",
    ),
   AlertModel(
      id: 6,
      date: "2023-10-06",
      duration: 3.0,
      notes: "Conducted system maintenance tasks",
   )
  ];
}







