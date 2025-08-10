class MissionCheckHandledAlertsRequestModel {
  final String fromDate;
  final String toDate;
  final int unit;

  MissionCheckHandledAlertsRequestModel({
    required this.fromDate,
    required this.toDate,
    required this.unit,
  });

  Map<String, dynamic> toQueryParams() => {
    'fromDate': fromDate,
    'toDate': toDate,
    'duration': unit.toString(),
  };
}