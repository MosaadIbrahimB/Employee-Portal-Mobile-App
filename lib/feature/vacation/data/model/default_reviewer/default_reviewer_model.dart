class DefaultReviewerModel {
  int? id;
  int? employeeId;
  String? name;
  String? code;
  String? picPath;
  int? order;
  bool? singleApprovalEnabled;
  bool? isCurrent;

  String? status;
  String? note;


  DefaultReviewerModel(
      {this.id,
        this.employeeId,
        this.name,
        this.code,
        this.picPath,
        this.order,
        this.singleApprovalEnabled,
        this.isCurrent,
        this.status,
        this.note,


      });

  DefaultReviewerModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    employeeId = json['EmployeeId'];
    name = json['Name'];
    code = json['Code'];
    picPath = json['PicPath'];
    order = json['Order'];
    singleApprovalEnabled = json['SingleApprovalEnabled'];
    isCurrent = json['IsCurrent'];
    status = json['Status'];
    note = json['Note'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['EmployeeId'] = employeeId;
    data['Name'] =name;
    data['Code'] = code;
    data['PicPath'] = picPath;
    data['Order'] =order;
    data['SingleApprovalEnabled'] = singleApprovalEnabled;
    data['IsCurrent'] = isCurrent;
    data['Status'] = status;
    data['Note'] = note;
    return data;
  }


  Map<String, dynamic> toJsonPostVacation() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeId'] = employeeId;
    data['name'] =name;
    data['code'] = code;
    data['picPath'] = picPath;
    data['order'] =order;
    return data;
  }

}
