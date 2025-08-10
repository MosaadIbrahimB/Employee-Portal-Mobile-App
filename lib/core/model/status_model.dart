// import 'package:employee_portal_mobile_app/core/mission_model/reviewer_model.dart';
// import 'package:employee_portal_mobile_app/feature/vacation/data/mission_model/get_employee_vacations_model/get_employee_vacations_model.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../feature/request/data/mission_model/reviewer_model.dart';
//
// class StatusModel extends Equatable {
//   final bool? isCertified; //معتمده
//   final bool? isUnderReview; //تحت التدقيق
//   final bool? isRejected; //مرفوض
//   final String? name;
//
//   const StatusModel({
//     this.isCertified,
//     this.isUnderReview,
//     this.isRejected,
//     this.name,
//   });
//
//   factory StatusModel.employeeVacationsModel(
//       {required GetEmployeeVacationsModel employeeVacationsModel}) {
//     return StatusModel(
//       isCertified: employeeVacationsModel.isCertified,
//       isUnderReview: employeeVacationsModel.isUnderReview,
//       isRejected: employeeVacationsModel.isRejected,
//       name: employeeVacationsModel.typeName,
//     );
//
//   }
//   factory StatusModel.reviewerModel(
//       {required ReviewerModel  mission_model}) {
//     return StatusModel(
//       isCertified: mission_model.isCertified,
//       isUnderReview: mission_model.isUnderReview,
//       isRejected: mission_model.isRejected,
//     );
//
//   }
//   @override
//   List<Object?> get props => [isCertified, isUnderReview, isRejected, name];
// }