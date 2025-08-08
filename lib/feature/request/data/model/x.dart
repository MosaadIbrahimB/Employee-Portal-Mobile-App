// class Permissions {
//   final String? requestDate;
//   final String? permissionTypeName;
//   final String? from;
//   final String? to;
//   final String? destination;
//   final  double? duration;
//   final  String? notes;
//   final  String? attachments;
//   final  bool? editable;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   Permissions ({
//     required this.requestDate,
//     required this.permissionTypeName,
//     required this.from,
//     required this.to,
//     required this.destination,
//     required this.duration,
//     required this.notes,
//     required this.attachments,
//     required this.editable,
//     required this.status,
//     required this.reviewers
//   });
//   factory Permissions.fromJson(Map<String, dynamic> json) {
//     return Permissions(
//       requestDate: json["RequestDate"],
//       permissionTypeName:json["PermissionTypeName"],
//       from: json["From"],
//       to: json["To"],
//       destination: json["Destination"],
//       duration: json["Duration"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class ValidationPermissionModel {
//   final String? message;
//   final bool? isValid;
//
//
//   ValidationPermissionModel ({
//     required this.message,
//     required this.isValid,
//   });
//   factory ValidationPermissionModel.fromJson(Map<String, dynamic> json) {
//     return ValidationPermissionModel(
//         message: json["message"],
//         isValid: json["IsValid"]);
//
//   }
// }
// class ReviewPermissions {
//   final String? date;
//   final int? id;
//   final String? empName;
//   final String? empCode;
//   final String? empDepartment;
//   final String? jobTitle;
//   final String? from;
//   final String? to;
//   final  double? duration;
//   final  String? notes;
//   final bool editable;
//   final  String? attachments;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   ReviewPermissions ({
//     required this.date,
//     required this.id,
//     required this.empName,
//     required this.empCode,
//     required this.empDepartment,
//     required this.jobTitle,
//     required this.from,
//     required this.to,
//     required this.duration,
//     required this.notes,
//     required this.editable,
//     required this.attachments,
//     required this.status,
//     required this.reviewers
//   });
//   factory ReviewPermissions.fromJson(Map<String, dynamic> json) {
//     return ReviewPermissions(
//
//       date: json["RequestDate"],
//       id: json["Id"],
//       empName: json["EmployeeName"],
//       empCode: json["EmployeeCode"],
//       empDepartment: json["Department"],
//       jobTitle: json["JobTitle"],
//       from: json["From"],
//       to: json["To"],
//       duration: json["Duration"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class ReviewedPermissions {
//   final String? date;
//   final int? id;
//   final String? empName;
//   final String? empCode;
//   final String? empDepartment;
//   final String? jobTitle;
//   final String? from;
//   final String? to;
//   final  double? duration;
//   final  String? notes;
//   final bool editable;
//   final  String? attachments;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   ReviewedPermissions ({
//     required this.date,
//     required this.id,
//     required this.empName,
//     required this.empCode,
//     required this.empDepartment,
//     required this.jobTitle,
//     required this.from,
//     required this.to,
//     required this.duration,
//     required this.notes,
//     required this.editable,
//     required this.attachments,
//     required this.status,
//     required this.reviewers
//   });
//   factory ReviewedPermissions.fromJson(Map<String, dynamic> json) {
//     return ReviewedPermissions(
//
//       date: json["RequestDate"],
//       id: json["Id"],
//       empName: json["EmployeeName"],
//       empCode: json["EmployeeCode"],
//       empDepartment: json["Department"],
//       jobTitle: json["JobTitle"],
//       from: json["From"],
//       to: json["To"],
//       duration: json["Duration"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class FinancialType {
//   final int? id;
//   final String? name;
//   final bool? isEditableByEmployee;
//   final double? defaultValue;
//
//   FinancialType ({
//     required this.id,
//     required this.name,
//     required this.isEditableByEmployee,
//     required this.defaultValue
//
//   });
//   factory FinancialType.fromJson(Map<String, dynamic> json) {
//     return FinancialType(
//         id: json["Id"],
//         name: json["Name"],
//         isEditableByEmployee: json["IsEditableByEmployee"],
//         defaultValue: json["DefaultValue"]
//
//     );
//   }
// }
// class SaveFinancial {
//   final int? requestType;
//   final String? date;
//   final List<Reviewers> reviewers;
//
//   SaveFinancial({
//     required this.requestType,
//     required this.date,
//     required this.reviewers
//   });
//   factory SaveFinancial.fromJson(Map<String, dynamic> json) {
//     return SaveFinancial(
//       requestType: json["requestType"],
//       date: json["date"],
//       reviewers: json["reviewers"],
//
//     );
//   }
// }
// class Financial {
//   final String? requestDate;
//   final String? requestType;
//   final String? date;
//   final String? value;
//   final  String? notes;
//   final  String? attachments;
//   final  bool? editable;
//   final String? status;
//   final List<Reviewers> reviewers;
//
//   Financial ({
//     required this.requestDate,
//     required this.requestType,
//     required this.date,
//     required this.value,
//     required this.notes,
//     required this.attachments,
//     required this.editable,
//     required this.status,
//     required this.reviewers
//   });
//   factory Financial.fromJson(Map<String, dynamic> json) {
//     return Financial(
//       requestDate: json["RequestDate"],
//       requestType: json["RequestType"],
//       date: json["Date"],
//       value: json["Value"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class ReviewFinancialModel {
//   final String? date;
//   final int? id;
//   final String? empName;
//   final String? empCode;
//   final String? empDepartment;
//   final String? jobTitle;
//   final String? type;
//   final  String? value;
//   final  String? notes;
//   final bool editable;
//   final  String? attachments;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   ReviewFinancialModel ({
//     required this.date,
//     required this.id,
//     required this.empName,
//     required this.empCode,
//     required this.empDepartment,
//     required this.jobTitle,
//     required this.type,
//     required this.value,
//     required this.notes,
//     required this.editable,
//     required this.attachments,
//     required this.status,
//     required this.reviewers
//   });
//   factory ReviewFinancialModel.fromJson(Map<String, dynamic> json) {
//     return ReviewFinancialModel(
//
//       date: json["RequestDate"],
//       id: json["Id"],
//       empName: json["EmployeeName"],
//       empCode: json["EmployeeCode"],
//       empDepartment: json["Department"],
//       jobTitle: json["JobTitle"],
//       type: json["Type"],
//       value: json["Value"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class ReviewedFinancialModel {
//   final String? date;
//   final int? id;
//   final String? empName;
//   final String? empCode;
//   final String? empDepartment;
//   final String? jobTitle;
//   final String? type;
//   final  String? value;
//   final  String? notes;
//   final bool editable;
//   final  String? attachments;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   ReviewedFinancialModel ({
//     required this.date,
//     required this.id,
//     required this.empName,
//     required this.empCode,
//     required this.empDepartment,
//     required this.jobTitle,
//     required this.type,
//     required this.value,
//     required this.notes,
//     required this.editable,
//     required this.attachments,
//     required this.status,
//     required this.reviewers
//   });
//   factory ReviewedFinancialModel.fromJson(Map<String, dynamic> json) {
//     return ReviewedFinancialModel(
//
//       date: json["RequestDate"],
//       id: json["Id"],
//       empName: json["EmployeeName"],
//       empCode: json["EmployeeCode"],
//       empDepartment: json["Department"],
//       jobTitle: json["JobTitle"],
//       type: json["Type"],
//       value: json["Value"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class AdminType {
//   final int? id;
//   final String? name;
//   final bool? isEditableByEmployee;
//   final double? defaultValue;
//
//   AdminType ({
//     required this.id,
//     required this.name,
//     required this.isEditableByEmployee,
//     required this.defaultValue
//
//   });
//   factory AdminType.fromJson(Map<String, dynamic> json) {
//     return AdminType(
//         id: json["Id"],
//         name: json["Name"],
//         isEditableByEmployee: json["IsEditableByEmployee"],
//         defaultValue: json["DefaultValue"]
//
//     );
//   }
// }
// class SaveAdmin {
//   final int? requestType;
//   final String? date;
//   final List<Reviewers> reviewers;
//
//   SaveAdmin({
//     required this.requestType,
//     required this.date,
//     required this.reviewers
//   });
//   factory SaveAdmin.fromJson(Map<String, dynamic> json) {
//     return SaveAdmin(
//       requestType: json["requestType"],
//       date: json["date"],
//       reviewers: json["reviewers"],
//
//     );
//   }
// }
// class Admin {
//   final String? requestDate;
//   final String? requestType;
//   final String? date;
//   final  String? notes;
//   final  String? attachments;
//   final  bool? editable;
//   final String? status;
//   final List<Reviewers> reviewers;
//
//   Admin ({
//     required this.requestDate,
//     required this.requestType,
//     required this.date,
//     required this.notes,
//     required this.attachments,
//     required this.editable,
//     required this.status,
//     required this.reviewers
//   });
//   factory Admin.fromJson(Map<String, dynamic> json) {
//     return Admin(
//       requestDate: json["RequestDate"],
//       requestType: json["RequestType"],
//       date: json["Date"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class ReviewAdminModel {
//   final String? date;
//   final int? id;
//   final String? empName;
//   final String? empCode;
//   final String? empDepartment;
//   final String? jobTitle;
//   final String? type;
//   final  String? value;
//   final  String? notes;
//   final bool editable;
//   final  String? attachments;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   ReviewAdminModel ({
//     required this.date,
//     required this.id,
//     required this.empName,
//     required this.empCode,
//     required this.empDepartment,
//     required this.jobTitle,
//     required this.type,
//     required this.value,
//     required this.notes,
//     required this.editable,
//     required this.attachments,
//     required this.status,
//     required this.reviewers
//   });
//   factory ReviewAdminModel.fromJson(Map<String, dynamic> json) {
//     return ReviewAdminModel(
//
//       date: json["RequestDate"],
//       id: json["Id"],
//       empName: json["EmployeeName"],
//       empCode: json["EmployeeCode"],
//       empDepartment: json["Department"],
//       jobTitle: json["JobTitle"],
//       type: json["Type"],
//       value: json["Value"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class ReviewedAdminModel {
//   final String? date;
//   final int? id;
//   final String? empName;
//   final String? empCode;
//   final String? empDepartment;
//   final String? jobTitle;
//   final String? type;
//   final  String? value;
//   final  String? notes;
//   final bool editable;
//   final  String? attachments;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   ReviewedAdminModel ({
//     required this.date,
//     required this.id,
//     required this.empName,
//     required this.empCode,
//     required this.empDepartment,
//     required this.jobTitle,
//     required this.type,
//     required this.value,
//     required this.notes,
//     required this.editable,
//     required this.attachments,
//     required this.status,
//     required this.reviewers
//   });
//   factory ReviewedAdminModel.fromJson(Map<String, dynamic> json) {
//     return ReviewedAdminModel(
//
//       date: json["RequestDate"],
//       id: json["Id"],
//       empName: json["EmployeeName"],
//       empCode: json["EmployeeCode"],
//       empDepartment: json["Department"],
//       jobTitle: json["JobTitle"],
//       type: json["Type"],
//       value: json["Value"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
//
//
// //change shift
// class ChangeShiftType {
//   final int? id;
//   final String? name;
//
//   ChangeShiftType ({
//     required this.id,
//     required this.name,
//   });
//   factory ChangeShiftType.fromJson(Map<String, dynamic> json) {
//     return ChangeShiftType(
//       id: json["PlanId"],
//       name: json["Name"],
//     );
//   }
// }
// class SaveChangeShift {
//   final int requestType;
//   final String? date;
//   final int? shiftValue;
//   final String? note;
//   final List<Reviewers> reviewers;
//
//   SaveChangeShift({
//     required this.requestType,
//     required this.date,
//     required this.shiftValue,
//     required this.note,
//     required this.reviewers
//   });
//   factory SaveChangeShift.fromJson(Map<String, dynamic> json) {
//     return SaveChangeShift(
//       requestType:json["requestType"],
//       date: json["date"],
//       shiftValue:json["value"],
//       note:json["note"],
//       reviewers: json["reviewers"],
//
//     );
//   }
// }
// class ChangeShift {
//   final String? requestDate;
//   final int? value;
//   final  String? notes;
//   final  String? attachments;
//   final  bool? editable;
//   final String? status;
//   final List<Reviewers> reviewers;
//
//   ChangeShift ({
//     required this.requestDate,
//     required this.value,
//     required this.notes,
//     required this.attachments,
//     required this.editable,
//     required this.status,
//     required this.reviewers
//   });
//   factory ChangeShift.fromJson(Map<String, dynamic> json) {
//     return ChangeShift(
//       requestDate: json["RequestDate"],
//       value: json["Value"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class ReviewChangeShiftModel {
//   final String? date;
//   final int? id;
//   final String? empName;
//   final String? empCode;
//   final String? empDepartment;
//   final String? jobTitle;
//   final String? type;
//   final  String? value;
//   final  String? notes;
//   final bool editable;
//   final  String? attachments;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   ReviewChangeShiftModel ({
//     required this.date,
//     required this.id,
//     required this.empName,
//     required this.empCode,
//     required this.empDepartment,
//     required this.jobTitle,
//     required this.type,
//     required this.value,
//     required this.notes,
//     required this.editable,
//     required this.attachments,
//     required this.status,
//     required this.reviewers
//   });
//   factory ReviewChangeShiftModel.fromJson(Map<String, dynamic> json) {
//     return ReviewChangeShiftModel(
//
//       date: json["RequestDate"],
//       id: json["Id"],
//       empName: json["EmployeeName"],
//       empCode: json["EmployeeCode"],
//       empDepartment: json["Department"],
//       jobTitle: json["JobTitle"],
//       type: json["Type"],
//       value: json["Value"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }
// class ReviewedChangeShiftModel {
//   final String? date;
//   final int? id;
//   final String? empName;
//   final String? empCode;
//   final String? empDepartment;
//   final String? jobTitle;
//   final String? type;
//   final  String? value;
//   final  String? notes;
//   final bool editable;
//   final  String? attachments;
//   final String? status;
//   final List<dynamic> reviewers;
//
//   ReviewedChangeShiftModel ({
//     required this.date,
//     required this.id,
//     required this.empName,
//     required this.empCode,
//     required this.empDepartment,
//     required this.jobTitle,
//     required this.type,
//     required this.value,
//     required this.notes,
//     required this.editable,
//     required this.attachments,
//     required this.status,
//     required this.reviewers
//   });
//   factory ReviewedChangeShiftModel.fromJson(Map<String, dynamic> json) {
//     return ReviewedChangeShiftModel(
//
//       date: json["RequestDate"],
//       id: json["Id"],
//       empName: json["EmployeeName"],
//       empCode: json["EmployeeCode"],
//       empDepartment: json["Department"],
//       jobTitle: json["JobTitle"],
//       type: json["Type"],
//       value: json["Value"],
//       notes: json["Notes"],
//       attachments: json["Attachments"],
//       editable: json["Editable"],
//       status: json["Status"],
//       reviewers: json["Reviewers"],
//     );
//   }
// }