class LoanTypeModel {
  int? id;
  String? name;
  int? maxNoOfPayments;

  LoanTypeModel({this.id, this.name, this.maxNoOfPayments});

  LoanTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    maxNoOfPayments = json['MaxNoOfPayments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['MaxNoOfPayments'] = maxNoOfPayments;
    return data;
  }
}
