class ResponsePostAdministrativeFinancialRequest {
  String? message;
  bool? isValid;

  ResponsePostAdministrativeFinancialRequest({this.message, this.isValid});

  ResponsePostAdministrativeFinancialRequest.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isValid = json['IsValid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['IsValid'] = isValid;
    return data;
  }
}
