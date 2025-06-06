class ResponsePostVacationModel {
  int? count;
String?message;
bool ?isValid;

  ResponsePostVacationModel({this.count,this.message, this.isValid});

  ResponsePostVacationModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    message = json['Message'];
    isValid = json['IsValid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['Message'] = message;
    data['IsValid'] = isValid;
    return data;
  }
}
