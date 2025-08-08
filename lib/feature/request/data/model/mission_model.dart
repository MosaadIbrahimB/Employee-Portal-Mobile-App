import 'package:employee_portal_mobile_app/feature/request/data/model/reviewer_model.dart';


class Missions {
  final String? requestDate;
  final String? from;
  final String? to;
  final String? destination;
  final  String? duration;
  final  String? notes;
  final  String? attachments;
  final  bool? editable;
  final String? status;
  final List<ReviewerModel> reviewers;

  Missions ({
    required this.requestDate,
    required this.from,
    required this.to,
    required this.destination,
    required this.duration,
    required this.notes,
    required this.attachments,
    required this.editable,
    required this.status,
    required this.reviewers
  });
  factory Missions.fromJson(Map<String, dynamic> json) {
    return Missions(
      requestDate: json["RequestDate"],
      from: json["From"],
      to: json["To"],
      destination: json["Destination"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewMissions {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? from;
  final String? to;
  final String? destination;
  final  String? duration;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewMissions ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.from,
    required this.to,
    required this.destination,
    required this.duration,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewMissions.fromJson(Map<String, dynamic> json) {
    return ReviewMissions(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      from: json["From"],
      to: json["To"],
      destination: json["Destination"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewedMissions {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? from;
  final String? to;
  final String? duration;
  final String? notes;
  final bool editable;
  final String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewedMissions ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.from,
    required this.to,
    required this.duration,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewedMissions.fromJson(Map<String, dynamic> json) {
    return ReviewedMissions(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      from: json["From"],
      to: json["To"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ValidationMissionModel {
  final bool? isValid;


  ValidationMissionModel ({
    required this.isValid,
  });
  factory ValidationMissionModel.fromJson(Map<String, dynamic> json) {
    return ValidationMissionModel(
        isValid: json["IsValid"]);

  }
}
