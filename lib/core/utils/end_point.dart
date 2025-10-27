class EndPoint {
  static const String baseUrlMohr = "https://mohrapi.azurewebsites.net";
  static const String baseUrlSync = "https://api.hr-sync.com";
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
  static const String getEmployeeFinancialTrue =
      "/api/Financial/Requests/Employee/true";
  static const String getEmployeeFinancialFalse =
      "/api/Financial/Requests/Employee/false";

  static const String getReviewerFinancialTrue =
      "/api/Financial/Requests/Reviewer/true";
  static const String getReviewerFinancialFalse =
      "/api/Financial/Requests/Reviewer/false";

  //Administrative
  static const String getEmployeeAdminTrue =
      "/api/Administrative/Requests/Employee/true";
  static const String getEmployeeAdminFalse =
      "/api/Administrative/Requests/Employee/false";

  static const String getReviewerAdminTrue =
      "/api/Administrative/Requests/Reviewer/true";
  static const String getReviewerAdminFalse =
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
      "/Api/Mission/ValidateMission";
  static const String checkForHandledAlert =
      "/Api/Mission/CheckForHandledAlerts";
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
  static const String getTypeOvertime = "/Api/Requests/GetRequestTypes?requestType=7";
  static const String getReviewerOvertimeTrue= "$overtime/Reviewer/true";
  static const String getReviewerOvertimeFalse= "$overtime/Reviewer/false";
  static const String getEmployeeOvertimeTrue= "$overtime/Employee/true";
  static const String getEmployeeOvertimeFalse= "$overtime/Employee/false";
  static const String getAlert= "/api/OvertimeRequests";
  static const String getAlerts= "/api/OvertimeRequests";
  static const String postOvertime= "/Api/OvertimeRequests";
//loan
  static const String loan = "/api/Loan";
  static const String requests= "$loan/Requests";
  static const String getLoan = "$loan/GetLoans";
  static const String getTypeLoan = "$loan/LoanTypes";
  static const String getReviewerLoanTrue= "$requests/Reviewer/true";
  static const String getReviewerLoanFalse= "$requests/Reviewer/false";
  static const String getEmployeeLoanTrue= "$requests/Employee/true";
  static const String getEmployeeLoanFalse= "$requests/Employee/false";
  static const String validateLoan= "$loan/VaildateLoan";
  static const String postLoan= loan;

}
