class ErrorModel implements Exception {
  final String? message;
  final int? statusCode;

  ErrorModel({this.message, this.statusCode});

factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'] ,
      statusCode: json['statusCode'] ,
    );
  }

  @override
  String toString() => 'ErrorModel: $message (status code: $statusCode)';
}