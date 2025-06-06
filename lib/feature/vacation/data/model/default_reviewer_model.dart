class DefaultReviewerModel {
  int? id;
  int? employeeId;
  String? name;
  String? code;
  String? picPath;
  int? order;
  bool? singleApprovalEnabled;
  bool? isCurrent;

  DefaultReviewerModel(
      {this.id,
        this.employeeId,
        this.name,
        this.code,
        this.picPath,
        this.order,
        this.singleApprovalEnabled,
        this.isCurrent});

  DefaultReviewerModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    employeeId = json['EmployeeId'];
    name = json['Name'];
    code = json['Code'];
    picPath = json['PicPath'];
    order = json['Order'];
    singleApprovalEnabled = json['SingleApprovalEnabled'];
    isCurrent = json['IsCurrent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['EmployeeId'] = this.employeeId;
    data['Name'] = this.name;
    data['Code'] = this.code;
    data['PicPath'] = this.picPath;
    data['Order'] = this.order;
    data['SingleApprovalEnabled'] = this.singleApprovalEnabled;
    data['IsCurrent'] = this.isCurrent;
    return data;
  }
}
