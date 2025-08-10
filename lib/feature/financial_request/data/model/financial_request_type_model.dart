class FinancialRequestTypeModel {
  int? id;
  String? name;
  bool? isEditableByEmployee;

  FinancialRequestTypeModel({this.id, this.name, this.isEditableByEmployee});

  FinancialRequestTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    isEditableByEmployee = json['IsEditableByEmployee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['IsEditableByEmployee'] = isEditableByEmployee;
    return data;
  }
}
