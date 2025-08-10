import 'package:employee_portal_mobile_app/feature/request/data/model/reviewer_model.dart';
import 'package:equatable/equatable.dart';

class ResponseFinancialModel extends Equatable {
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
  final List<ReviewerModel>? reviewers;

  const ResponseFinancialModel({
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

  factory ResponseFinancialModel.fromJson(Map<String, dynamic> json) {
    return ResponseFinancialModel(
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
          ? List<ReviewerModel>.from(json['Reviewers'].map((v) => ReviewerModel.fromJson(v)))
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


  static final List<ResponseFinancialModel> sampleFinancialRequests = [
    ResponseFinancialModel(
      id: 1,
      empName: "أحمد محمد",
      empCode: "EMP001",
      empDepartment: "الموارد البشرية",
      jobTitle: "أخصائي توظيف",
      requestDate: "2025-07-01",
      requestTypeName: "طلب سلفة",
      date: "2025-07-10",
      value: 1500.0,
      notes: "سلفة شخصية قبل العيد",
      editable: true,
      attachments: "slfa_doc.pdf",
      status: "قيد المراجعة",
      reviewers: [
        ReviewerModel(name: "على", status: "موافقة", note: "123"),
        ReviewerModel(name: "محمد", status: "قيد الانتظار", note: "123"),
      ],
    ),
    ResponseFinancialModel(
      id: 2,
      empName: "سارة علي",
      empCode: "EMP002",
      empDepartment: "تقنية المعلومات",
      jobTitle: "مهندسة نظم",
      requestDate: "2025-07-05",
      requestTypeName: "طلب إذن",
      date: "2025-07-15",
      value: 0.0,
      notes: "إذن خروج مبكر لظرف عائلي",
      editable: false,
      attachments: null,
      status: "مرفوض",
      reviewers: [
        ReviewerModel(name: "مدير المشروع", status: "مرفوض", note: "غير مبرر"),
      ],
    ),
    ResponseFinancialModel(
      id: 3,
      empName: "محمد سعيد",
      empCode: "EMP003",
      empDepartment: "المحاسبة",
      jobTitle: "محاسب أول",
      requestDate: "2025-07-03",
      requestTypeName: "ساعات عمل إضافي",
      date: "2025-07-12",
      value: 300.0,
      notes: "عمل إضافي في نهاية الأسبوع",
      editable: true,
      attachments: "extra_hours.jpg",
      status: "معتمد",
      reviewers: [
        ReviewerModel(name: "المدير المباشر", status: "موافق", note: "تم التأكيد على الساعات"),
        ReviewerModel(name: "المالية", status: "موافق", note: "تم رصد المبلغ"),
      ],
    ),
    ResponseFinancialModel(
      id: 3,
      empName: "محمد ",
      empCode: "EMP003",
      empDepartment: "المحاسبة",
      jobTitle: "محاسب أول",
      requestDate: "2025-07-03",
      requestTypeName: "ساعات عمل إضافي",
      date: "2025-07-12",
      value: 300.0,
      notes: "عمل إضافي في نهاية الأسبوع",
      editable: true,
      attachments: "extra_hours.jpg",
      status: "معتمد",
      reviewers: [
        ReviewerModel(name: "المدير المباشر", status: "موافق", note: "تم التأكيد على الساعات"),
        ReviewerModel(name: "المالية", status: "موافق", note: "تم رصد المبلغ"),
      ],
    ),
    ResponseFinancialModel(
      id: 2,
      empName: "سارة علي",
      empCode: "EMP002",
      empDepartment: "تقنية المعلومات",
      jobTitle: "مهندسة نظم",
      requestDate: "2025-07-05",
      requestTypeName: "طلب إذن",
      date: "2025-07-15",
      value: 0.0,
      notes: "إذن خروج مبكر لظرف عائلي",
      editable: false,
      attachments: null,
      status: "مرفوض",
      reviewers: [
        ReviewerModel(name: "مدير المشروع", status: "مرفوض", note: "غير مبرر"),
      ],
    ),
    ResponseFinancialModel(
      id: 3,
      empName: "محمد سعيد",
      empCode: "EMP003",
      empDepartment: "المحاسبة",
      jobTitle: "محاسب أول",
      requestDate: "2025-07-03",
      requestTypeName: "ساعات عمل إضافي",
      date: "2025-07-12",
      value: 300.0,
      notes: "عمل إضافي في نهاية الأسبوع",
      editable: true,
      attachments: "extra_hours.jpg",
      status: "معتمد",
      reviewers: [
        ReviewerModel(name: "المدير المباشر", status: "موافق", note: "تم التأكيد على الساعات"),
        ReviewerModel(name: "المالية", status: "موافق", note: "تم رصد المبلغ"),
      ],
    ),
    ResponseFinancialModel(
      id: 1,
      empName: "أحمد محمد",
      empCode: "EMP001",
      empDepartment: "الموارد البشرية",
      jobTitle: "أخصائي توظيف",
      requestDate: "2025-07-01",
      requestTypeName: "طلب سلفة",
      date: "2025-07-10",
      value: 1500.0,
      notes: "سلفة شخصية قبل العيد",
      editable: true,
      attachments: "slfa_doc.pdf",
      status: "قيد المراجعة",
      reviewers: [
        ReviewerModel(name: "على", status: "موافقة", note: "123"),
        ReviewerModel(name: "محمد", status: "قيد الانتظار", note: "123"),
      ],
    ),

  ];

}

