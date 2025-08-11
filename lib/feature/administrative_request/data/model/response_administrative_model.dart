import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:equatable/equatable.dart';

class ResponseAdministrativeModel extends Equatable {
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;

  final String? requestDate;
  final String? requestTypeName;
  final String? date;
  final double? value;
  final String? notes;
  final bool? editable;
  final String? attachments;
  final String? status;
  final List<DefaultReviewerModel>? reviewers;

  const ResponseAdministrativeModel({
    this.id,
    this.empName,
    this.empCode,
    this.empDepartment,
    this.jobTitle,
    this.requestDate,
    this.requestTypeName,
    this.date,
    this.value,
    this.notes,
    this.editable,
    this.attachments,
    this.status,
    this.reviewers,
  });

  factory ResponseAdministrativeModel.fromJson(Map<String, dynamic> json) {
    return ResponseAdministrativeModel(
      id: json['Id'],
      empName: json['EmployeeName'],
      empCode: json['EmployeeCode'],
      empDepartment: json['Department'],
      jobTitle: json['JobTitle'],
      requestDate: json['RequestDate'],
      requestTypeName: json['RequestTypeName'],
      date: json['Date'],
      value: json['Value']?.toDouble(),
      notes: json['Notes'],
      editable: json['Editable'],
      attachments: json['Attachments'],
      status: json['Status'],
      reviewers: json['Reviewers'] != null
          ? List<DefaultReviewerModel>.from(json['Reviewers'].map((v) => DefaultReviewerModel.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'EmployeeName': empName,
      'EmployeeCode': empCode,
      'Department': empDepartment,
      'JobTitle': jobTitle,
      'RequestDate': requestDate,
      'RequestTypeName': requestTypeName,
      'Date': date,
      'Value': value,
      'Notes': notes,
      'Editable': editable,
      'Attachments': attachments,
      'Status': status,
      'Reviewers': reviewers?.map((v) => v.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    id,
    empName,
    empCode,
    empDepartment,
    jobTitle,
    requestDate,
    requestTypeName,
    date,
    value,
    notes,
    editable,
    attachments,
    status,
    reviewers,
  ];


  static final List<ResponseAdministrativeModel> sampleAdministrativeRequests = [

    ResponseAdministrativeModel(
      id: 1,
      empName: 'Ahmed Ali',
      empCode: 'EMP001',
      empDepartment: 'HR',
      jobTitle: 'HR Manager',
      requestDate: '2023-10-01',
      requestTypeName: 'Leave Request',
      date: '2023-10-05',
      value: 0.0,
      notes: 'Annual leave request for 5 days.',
      editable: true,
      attachments: 'leave_request.pdf',
      status: 'Pending',
      reviewers: [
        DefaultReviewerModel( name: 'Sara', status: 'HR Director'),
        DefaultReviewerModel( name: 'Mohamed', status: 'CEO'),
      ],
    ),
    ResponseAdministrativeModel(
      id: 2,
      empName: 'Fatima Hassan',
      empCode: 'EMP002',
      empDepartment: 'Finance',
      jobTitle: 'Accountant',
      requestDate: '2023-10-02',
      requestTypeName: 'Expense Reimbursement',
      date: '2023-10-06',
      value: 250.0,
      notes: 'Reimbursement for travel expenses.',
      editable: false,
      attachments: 'expense_receipt.pdf',
      status: 'Reviewed',
      reviewers: [
        DefaultReviewerModel( name: 'Ali', status: 'Finance Manager'),
        DefaultReviewerModel( name: 'Omar', status: 'CFO'),
      ],
    ),

  ];

}

