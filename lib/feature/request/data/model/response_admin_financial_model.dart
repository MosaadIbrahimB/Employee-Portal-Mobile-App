import 'package:equatable/equatable.dart';

class ResponseAdminFinancialModel extends Equatable {
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
  final List<Reviewers>? reviewers;

  const ResponseAdminFinancialModel({
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

  factory ResponseAdminFinancialModel.fromJson(Map<String, dynamic> json) {
    return ResponseAdminFinancialModel(
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
          ? List<Reviewers>.from(json['Reviewers'].map((v) => Reviewers.fromJson(v)))
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


  static final List<ResponseAdminFinancialModel> sampleFinancialRequests = [
    ResponseAdminFinancialModel(
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
        Reviewers(name: "على", status: "موافقة", note: "123"),
        Reviewers(name: "محمد", status: "قيد الانتظار", note: "123"),
      ],
    ),
    ResponseAdminFinancialModel(
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
        Reviewers(name: "مدير المشروع", status: "مرفوض", note: "غير مبرر"),
      ],
    ),
    ResponseAdminFinancialModel(
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
        Reviewers(name: "المدير المباشر", status: "موافق", note: "تم التأكيد على الساعات"),
        Reviewers(name: "المالية", status: "موافق", note: "تم رصد المبلغ"),
      ],
    ),
    ResponseAdminFinancialModel(
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
        Reviewers(name: "المدير المباشر", status: "موافق", note: "تم التأكيد على الساعات"),
        Reviewers(name: "المالية", status: "موافق", note: "تم رصد المبلغ"),
      ],
    ),
    ResponseAdminFinancialModel(
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
        Reviewers(name: "مدير المشروع", status: "مرفوض", note: "غير مبرر"),
      ],
    ),
    ResponseAdminFinancialModel(
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
        Reviewers(name: "المدير المباشر", status: "موافق", note: "تم التأكيد على الساعات"),
        Reviewers(name: "المالية", status: "موافق", note: "تم رصد المبلغ"),
      ],
    ),
    ResponseAdminFinancialModel(
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
        Reviewers(name: "على", status: "موافقة", note: "123"),
        Reviewers(name: "محمد", status: "قيد الانتظار", note: "123"),
      ],
    ),

  ];

}

class Reviewers extends Equatable {
  final String? name;
  final String? status;
  final String? note;

  const Reviewers({this.name, this.status, this.note});

  factory Reviewers.fromJson(Map<String, dynamic> json) {
    return Reviewers(
      name: json['Name'],
      status: json['Status'],
      note: json['Note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Status': status,
      'Note': note,
    };
  }

  @override
  List<Object?> get props => [name, status, note];




}
