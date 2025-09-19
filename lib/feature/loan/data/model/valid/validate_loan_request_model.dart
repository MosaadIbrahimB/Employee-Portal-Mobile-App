class ValidateLoanRequestModel {
  final int loanTypeId;
  final int installments;
  final double value;
  final DateTime startDate;

  ValidateLoanRequestModel({
    required this.loanTypeId,
    required this.installments,
    required this.value,
    required this.startDate,
  });

  Map<String, String> toQueryParams() {
    return {
      'loanTypeId': loanTypeId.toString(),
      'installments': installments.toString(),
      'value': value.toString(),
      'startDate': startDate.toIso8601String().split('T')[0],
    };
  }
}
