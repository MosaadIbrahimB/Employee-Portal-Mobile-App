import '../request_model.dart';

class PostLoanRequestModel {
  String? date;
  int? value;
  String? startDate;
  int? installments;
  bool? isRequest;
  String? notes;
  int? loanTypeId;
  RequestModel? request;

  PostLoanRequestModel({
    this.date,
    this.value,
    this.startDate,
    this.installments,
    this.isRequest,
    this.notes,
    this.loanTypeId,
    this.request,
  });

  PostLoanRequestModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    value = json['value'];
    startDate = json['startDate'];
    installments = json['installments'];
    isRequest = json['isRequest'];
    notes = json['notes'];
    loanTypeId = json['loanTypeId'];
    request =
        json['request'] != null ? RequestModel.fromJson(json['request']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['value'] = value;
    data['startDate'] = startDate;
    data['installments'] = installments;
    data['isRequest'] = isRequest;
    data['notes'] = notes;
    data['loanTypeId'] = loanTypeId;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    return data;
  }
}
