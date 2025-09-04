class EndPoint {
  static const String baseUrlMohr = "https://mohrapi.azurewebsites.net";
  // static const String baseUrl = "https://api.hr-sync.com";
  static const String baseUrl = "https://mohrapi.azurewebsites.net";
  static const String vacationTypes = "/api/Vacation/VacationTypes";
  static const String defaultReviewer = "/Api/Requests/GetDefaultReviewers";
  static const String postVacation = "/api/Vacation/PostVacation";
  static const String calculateVacationDuration =
      "/api/Vacation/CalculateVacationDuration";
  static const String validateVacation = "/api/Vacation/VaildateVacation";
  static const String checkHandledAlerts =
      "/api/Vacation/CheckForHandledAlerts";
  static const String getBalance = "/api/Vacation/getBalance";
  static const String getVacations = "/api/Vacation/GetVacations";
  static const String getVacationRequests =
      "/api/Vacation/Requests/Reviewer/true";
  static const String approveCancelRequest = "/Api/Requests";

  //request type
  static const String getRequestFinancial =
      "/Api/Requests/GetRequestTypes?requestType=6";
  static const String getRequestAdministrative =
      "/Api/Requests/GetRequestTypes?requestType=5";
  //Financial
  static const String getEmployeeReviewedFinancialRequest =
      "/api/Financial/Requests/Employee/true";
  static const String getEmployeePendingFinancialRequests =
      "/api/Financial/Requests/Employee/false";

  static const String getReviewerReviewedFinancialRequests =
      "/api/Financial/Requests/Reviewer/true";
  static const String getReviewerPendingFinancialRequests =
      "/api/Financial/Requests/Reviewer/false";

  //Administrative
  static const String getEmployeeReviewedAdministrativeRequest =
      "/api/Administrative/Requests/Employee/true";
  static const String getEmployeePendingAdministrativeRequest =
      "/api/Administrative/Requests/Employee/false";

  static const String getReviewerReviewedAdministrativeRequest =
      "/api/Administrative/Requests/Reviewer/true";
  static const String getReviewerPendingAdministrativeRequest =
      "/api/Administrative/Requests/Reviewer/false";
  static const String postRequest = "/Api/Requests";
  //mission
  static const String getMission = "/Api/Mission/GetMissions";
  static const String getReviewerReviewedMissionRequests =
      "/Api/Mission/Requests/Reviewer/true";
  static const String getReviewerNotReviewedMissionRequests =
      "/Api/Mission/Requests/Reviewer/false";

  static const String getEmployeeNotReviewedMissionRequests =
      "/Api/Mission/Requests/Employee/false";
  static const String getEmployeeReviewedMissionRequests =
      "/Api/Mission/Requests/Employee/true";

  static const String validateMission =
      "/Api/Mission/ValidateMission?from=2023-08-27 10:00:00.000&to=2023-08-27 11:00:00.000&unit=2";
  static const String checkForHandledAlert =
      "/Api/Mission/CheckForHandledAlerts?from=2023-08-27 10:00:00.000&to=2023-08-27 11:00:00.000&unit=2";
  static const String postMission = "/Api/Mission/PostMission";
  //Permission
  static const String permission = "/Api/Permission";
  static const String getPermission = "$permission/GetPermissions";
  static const String getAllowedPermission = "$permission/GetAllowedPermission";

  static const String reviewer = "$permission/Requests/Reviewer";
  static const String getReviewerTrue = "$reviewer/true";
  static const String getReviewerFalse = "$reviewer/false";

  static const String employee = "$permission/Requests/Employee";
  static const String getEmployeeTrue = "$employee/true";
  static const String getEmployeeFalse = "$employee/false";

  static const String postPermission = "$permission/PostPermission";
  //Overtime
  static const String overtime = "/api/Overtime/Requests";
  static const String getReviewerOvertimeTrue= "$overtime/Reviewer/true";
  static const String getReviewerOvertimeFalse= "$overtime/Reviewer/false";
  static const String getEmployeeOvertimeTrue= "$overtime/Employee/true";
  static const String getEmployeeOvertimeFalse= "$overtime/Employee/false";
  static const String getAlert= "/api/OvertimeRequests?id=1022322";
  static const String getAlerts= "/api/OvertimeRequests?fromDate=2025-05-01&toDate=2025-05-31";

  static const String postOvertime= "/Api/OvertimeRequests";


}
