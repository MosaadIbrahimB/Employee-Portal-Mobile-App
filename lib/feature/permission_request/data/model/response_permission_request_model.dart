import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';

class ResponsePermissionRequestModel {

  /*
  I don't know response credit API cause endPoint no response data,
  so add  id, empName, empCode, empDepartment, jobTitle
   like ResponseFinancialModel
   */

   int? id;
   String? empName;
   String? empCode;
   String? empDepartment;
   String? jobTitle;



  String? requestDate;
  String? from;
  String? to;
  double ?  duration;
  String? notes;
  String? permissionTypeName;
  String? attachments;
  bool? editable;
  String? status;
  List<DefaultReviewerModel>? reviewers;

 


  ResponsePermissionRequestModel({
    this.id,
    this.empName,
    this.empCode,
    this.empDepartment,
    this.jobTitle,

      this.requestDate,
        this.from,
        this.to,
        this.duration,
        this.notes,
        this.permissionTypeName,
        this.attachments,
        this.editable,
        this.status,
        this.reviewers});

  ResponsePermissionRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    empName = json['EmployeeName'];
    empCode= json['EmployeeCode'];
    empDepartment = json['Department'];
    jobTitle = json['JobTitle'];

    requestDate = json['RequestDate'];
    from = json['From'];
    to = json['To'];
    duration = json['Duration'];
    notes = json['Notes'];
    permissionTypeName = json['PermissionTypeName'];
    attachments = json['Attachments'];
    editable = json['Editable'];
    status = json['Status'];
    if (json['Reviewers'] != null) {
      reviewers = <DefaultReviewerModel>[];
      json['Reviewers'].forEach((v) {
        reviewers!.add(DefaultReviewerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['EmployeeName'] = empName;
    data['EmployeeCode'] = empCode;
    data['Department'] = empDepartment;
    data['JobTitle'] = jobTitle;



    data['RequestDate'] = requestDate;
    data['From'] = from;
    data['To'] = to;
    data['Duration'] = duration;
    data['Notes'] = notes;
    data['PermissionTypeName'] = permissionTypeName;
    data['Attachments'] = attachments;
    data['Editable'] = editable;
    data['Status'] = status;
    if (reviewers != null) {
      data['Reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }




static  List<ResponsePermissionRequestModel>listPermissionRequestModelFromJson=[
    ResponsePermissionRequestModel(
      id: 1,
      empName: "أحمد محمد علي",
      empCode: "EMP001",
      empDepartment: "تكنولوجيا المعلومات",
      jobTitle: "مهندس برمجيات",
      requestDate: "2024-11-01",
      from: "2024-11-10T09:00:00",
      to: "2024-11-10T10:00:00",
      duration: 1.0,
      notes: "طلب إذن للخروج مبكرًا لحضور موعد طبي.",
      permissionTypeName: "إذن خروج مبكر",
      attachments: "attachment1.pdf",
      editable: true,
      status: "موافق عليه",
      reviewers: [
        DefaultReviewerModel(id: 1, name: "مدير مباشر", status: "ok"),
        DefaultReviewerModel(id: 2, name: "الموارد البشرية", status: "no"),
      ],
    )
  ];
}

