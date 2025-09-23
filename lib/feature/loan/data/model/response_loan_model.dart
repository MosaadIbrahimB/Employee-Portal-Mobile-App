import '../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';

class LoanModel {
  String? requestDate;
  String? date;
  double? value;
  String? loanTypeName;
  int? installments;
  String? startDate;
  double? installmentValue;
  String? lastDate;
  String? attachments;
  bool? editable;
  String? status;
  List<DefaultReviewerModel>? reviewers;

  int? id;
  String? employeeName;
  String? employeeCode;
  int? employeeId;
  List<dynamic>? defendants;
  String? jobTitle;
  int? unpaid;
  int? requestedId;




  LoanModel(
      {this.requestDate,
        this.date,
        this.value,
        this.loanTypeName,
        this.installments,
        this.startDate,
        this.installmentValue,
        this.lastDate,
        this.attachments,
        this.editable,
        this.status,
        this.reviewers,
        this.id,
        this.employeeName,
        this.employeeCode,
        this.employeeId,
        this.defendants,
        this.jobTitle,
        this.unpaid,
        this.requestedId



      });

  LoanModel.fromJson(Map<String, dynamic> json) {
    requestDate = json['RequestDate'];
    date = json['Date'];
    value = json['Value'];
    loanTypeName = json['LoanTypeName'];
    installments = json['Installments'];
    startDate = json['StartDate'];
    installmentValue = json['InstallmentValue'];
    lastDate = json['LastDate'];
    attachments = json['Attachments'];
    editable = json['Editable'];
    status = json['Status'];
    if (json['Reviewers'] != null) {
      reviewers = <DefaultReviewerModel>[];
      json['Reviewers'].forEach((v) {
        reviewers!.add(DefaultReviewerModel.fromJson(v));
      });

    }
    id = json['Id'];
    employeeName = json['EmployeeName'];
    employeeCode = json['EmployeeCode'];
    employeeId = json['EmployeeId'];
    if (json['Defendants'] != null) {
      defendants = <dynamic>[];
      json['Defendants'].forEach((v) {
        defendants!.add(v);
      });
    }
    jobTitle = json['JobTitle'];
    unpaid = json['Unpaid'];
    requestedId = json['RequestedId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestDate'] = requestDate;
    data['Date'] = date;
    data['Value'] = value;
    data['LoanTypeName'] = loanTypeName;
    data['Installments'] = installments;
    data['StartDate'] = startDate;
    data['InstallmentValue'] = installmentValue;
    data['LastDate'] = lastDate;
    data['Attachments'] = attachments;
    data['Editable'] = editable;
    data['Status'] = status;
    if (reviewers != null) {
      data['Reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    data['Id'] = id;
    data['EmployeeName'] = employeeName;
    data['EmployeeCode'] = employeeCode;
    data['EmployeeId'] = employeeId;
    if (defendants != null) {
      data['Defendants'] = defendants!.map((v) => v).toList();
    }
    data['JobTitle'] = jobTitle;
    data['Unpaid'] = unpaid;
    data['RequestedId'] = requestedId;

    return data;
  }
}

// class LoanModel {
//   int? id;
//   String? empName;
//   String? empCode;
//   String? empDepartment;
//   String? jobTitle;
//
//   String? requestDate;
//   String? notes;
//   bool? editable;
//   String? status;
//   String? from;
//   String? to;
//   String? destination;
//   String? duration;
//   String? modifiedBy;
//   String? attachments;
//
//   String? requestTypeName;
//   String? date;
//   double? value;
//
//   List<DefaultReviewerModel>? reviewers;
//
//   LoanModel({
//     this.from,
//     this.to,
//     this.destination,
//     this.duration,
//     this.notes,
//     this.modifiedBy,
//     this.requestDate,
//     this.attachments,
//     this.editable,
//     this.status,
//     this.reviewers,
//     this.id,
//     this.empName,
//     this.empCode,
//     this.empDepartment,
//     this.jobTitle,
//     this.requestTypeName,
//     this.date,
//     this.value,
//
//   });
//
//   LoanModel.fromJson(Map<String, dynamic> json) {
//     from = json['From'];
//     to = json['To'];
//     destination = json['Destination'];
//     duration = json['Duration'];
//     notes = json['Notes'];
//     modifiedBy = json['ModifiedBy'];
//     requestDate = json['RequestDate'];
//     attachments = json['Attachments'];
//     editable = json['Editable'];
//     status = json['Status'];
//     if (json['Reviewers'] != null) {
//       reviewers = <DefaultReviewerModel>[];
//       json['Reviewers'].forEach((v) {
//         reviewers!.add(DefaultReviewerModel.fromJson(v));
//       });
//     }
//     id = json['Id'];
//     empName = json['EmployeeName'];
//     empCode = json['EmployeeCode'];
//     empDepartment = json['Department'];
//     jobTitle = json['JobTitle'];
//     requestTypeName = json['RequestTypeName'];
//     date = json['Date'];
//     value = json['Value'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['From'] = from;
//     data['To'] = to;
//     data['Destination'] = destination;
//     data['Duration'] = duration;
//     data['Notes'] = notes;
//     data['ModifiedBy'] = modifiedBy;
//     data['RequestDate'] = requestDate;
//     data['Attachments'] = attachments;
//     data['Editable'] = editable;
//     data['Status'] = status;
//     if (reviewers != null) {
//       data['Reviewers'] = reviewers!.map((v) => v.toJson()).toList();
//     }
//     data['Id'] = id;
//     data['EmployeeName'] = empName;
//     data['EmployeeCode'] = empCode;
//     data['Department'] = empDepartment;
//     data['JobTitle'] = jobTitle;
//     data['RequestTypeName'] = requestTypeName;
//     data['Date'] = date;
//     data['Value'] = value;
//
//
//     return data;
//   }
//
//   static final List<LoanModel> listOverTime = [
//     LoanModel(
//       id: 1,
//       empName: "أحمد محمد علي",
//       empCode: "EMP001",
//       empDepartment: "تكنولوجيا المعلومات",
//       jobTitle: "مصمم تجربة مستخدم",
//
//       from: "2025-04-07T00:00:00",
//       to: "2025-04-08T23:59:59",
//       destination: "الرياض",
//       duration: "2",
//       notes:
//       " هذه مأمورية تحتوي على 2 أيام غياب وتم معالجة هذه الأيام ك مأمورية ",
//       modifiedBy: "Agent",
//       status: "معتمد",
//       requestDate: "2025-04-01T10:30:00",
//       attachments: "attachment1.pdf,attachment2.jpg",
//       editable: true,
//       requestTypeName: "مأمورية داخلية",
//       date: "2025-04-07",
//       value: 1,
//
//     ),
//   ];
// }

