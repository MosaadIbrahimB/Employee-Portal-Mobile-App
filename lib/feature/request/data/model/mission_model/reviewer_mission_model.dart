
class ReviewerMissionModel {
  int? employeeId;
  String? code;
  String? name;
  String? status;
  String? note;

  ReviewerMissionModel({
    this.employeeId,
    this.code,
    this.name,
    this.status,
    this.note,
  });

  ReviewerMissionModel.fromJson(Map<String, dynamic> json) {
    // بيانات الشخص
    employeeId = json['employeeId'];
    code = json['code'];
    name = json['name'] ?? json['Name'];

    // بيانات المهمة
    status = json['status'] ?? json['Status'];
    note = json['note'] ?? json['Note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['employeeId'] = employeeId;
    data['code'] = code;
    data['name'] = name;
    data['status'] = status;
    data['note'] = note;
    return data;
  }
}
