class GetLoanModel {
  int? value;
  String? date;
  String? loanTypeName;
  int? installments;
  String? startDate;
  int? installmentValue;
  String? lastDate;
  int? paid;
  String? status;

  GetLoanModel(
      {this.value,
        this.date,
        this.loanTypeName,
        this.installments,
        this.startDate,
        this.installmentValue,
        this.lastDate,
        this.paid,
        this.status});

  GetLoanModel.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    date = json['Date'];
    loanTypeName = json['LoanTypeName'];
    installments = json['Installments'];
    startDate = json['StartDate'];
    installmentValue = json['InstallmentValue'];
    lastDate = json['LastDate'];
    paid = json['Paid'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['Date'] = date;
    data['LoanTypeName'] = loanTypeName;
    data['Installments'] = installments;
    data['StartDate'] = startDate;
    data['InstallmentValue'] = installmentValue;
    data['LastDate'] = lastDate;
    data['Paid'] = paid;
    data['Status'] = status;
    return data;
  }
}
