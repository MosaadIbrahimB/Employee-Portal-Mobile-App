class ValidateMissionRequestModel {
  final DateTime fromDate;
  final DateTime toDate;
  final double unit;

  ValidateMissionRequestModel({
    required this.fromDate,
    required this.toDate,
    required this.unit,
  });

  Map<String, dynamic> toQueryParameters() {
    return {
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'duration': unit,
    };
  }
}
