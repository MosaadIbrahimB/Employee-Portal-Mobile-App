class ReportModel{
  final String? typeReport; //نوع التقرير سلفه - اجازة
  final String? nameReport; // عنوان الطلب
  final String? not;
  final bool? isRequestAdvance;
  final bool? isSickLeave;
  final bool? isCertified; //معتمده
  final bool? isUnderReview; //تحت التدقيق
  final bool? isRejected; //تحت التدقيق
  final int? numberOfInstallments;//عدد الأقساط
  final int? amount;

  ReportModel(
      {this.typeReport, this.nameReport, this.not, this.isRequestAdvance,
        this.isSickLeave, this.isCertified, this.isUnderReview, this.isRejected,
        this.numberOfInstallments, this.amount}); // الرصيد



  static List<ReportModel> listReport=[
    ReportModel(
      typeReport: "تقرير الطلبات",
      nameReport: "طلب سلفة",
      isRequestAdvance: true,
      isCertified: true,
      numberOfInstallments: 3,
      amount: 234,
      not: "تقبل الله منكم الحج وقد تم اعتماد الاجازة",
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "اجازة مرضية",
      isUnderReview: true,
      isSickLeave: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
    isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
    ReportModel(
      typeReport: "تقرير الاجازات",
      nameReport: "طلب اذن",
      isRejected: true,
      numberOfInstallments: 2,
      amount: 20,
    ),
  ];
}
