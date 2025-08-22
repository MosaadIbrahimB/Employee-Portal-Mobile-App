class GetAllowedPermissionModel {
  String? text;
  String? value;
  int? id;
  int? duration;

  GetAllowedPermissionModel({this.text, this.value, this.duration});

  GetAllowedPermissionModel.fromJson(Map<String, dynamic> json) {
    text = json['Text'];
    value = json['Value'];
    id = json['value'];
    duration = json['Duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Text'] = text;
    data['Value'] = value;
    data['value'] = id;
    data['Duration'] = duration;
    return data;
  }
}
