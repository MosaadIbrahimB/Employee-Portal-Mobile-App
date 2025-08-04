class EndPoint {
  static const String baseUrlMohr = "https://mohrapi.azurewebsites.net";
  // static const String baseUrl = "https://api.hr-sync.com";
  static const String baseUrl = "https://mohrapi.azurewebsites.net";
  static const String vacationTypes = "/api/Vacation/VacationTypes";
  static const String defaultReviewer = "/Api/Requests/GetDefaultReviewers";
  static const String postVacation = "/api/Vacation/PostVacation";
  static const String calculateVacationDuration = "/api/Vacation/CalculateVacationDuration";
  static const String validateVacation = "/api/Vacation/VaildateVacation";
  static const String checkHandledAlerts = "/api/Vacation/CheckForHandledAlerts";
  static const String getBalance = "/api/Vacation/getBalance";
  static const String getVacations = "/api/Vacation/GetVacations";
  static const String getVacationRequests = "/api/Vacation/Requests/Reviewer/true";
  static const String approveCancelRequest = "/Api/Requests";

//request type
  static const String getRequestFinancial = "/Api/Requests/GetRequestTypes?requestType=6";
  static const String getRequestAdministrative = "/Api/Requests/GetRequestTypes?requestType=5";
//Financial
  static const String getEmployeeReviewedFinancialRequest="/api/Financial/Requests/Employee/true";
  static const String getEmployeePendingFinancialRequests="/api/Financial/Requests/Employee/false";

  static const String getReviewerReviewedFinancialRequests="/api/Financial/Requests/Reviewer/true";
  static const String getReviewerPendingFinancialRequests="/api/Financial/Requests/Reviewer/false";


//Administrative
  static const String getEmployeeReviewedAdministrativeRequest="/api/Administrative/Requests/Employee/true";
  static const String getEmployeePendingAdministrativeRequest="/api/Administrative/Requests/Employee/false";

  static const String getReviewerReviewedAdministrativeRequest="/api/Administrative/Requests/Reviewer/true";
  static const String getReviewerPendingAdministrativeRequest="/api/Administrative/Requests/Reviewer/false";
  static const String postRequest="/Api/Requests";

}
