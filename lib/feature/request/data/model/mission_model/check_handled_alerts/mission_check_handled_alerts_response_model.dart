class MissionCheckHandledAlertsResponseModel {
  final int count;
  final String message;

  MissionCheckHandledAlertsResponseModel({
    required this.count,
    required this.message,
  });

  factory MissionCheckHandledAlertsResponseModel.fromJson(Map<String, dynamic> json) {
    return MissionCheckHandledAlertsResponseModel(
      count: json['Count'] ?? 0,
      message: json['Message'] ?? '',
    );
  }
}