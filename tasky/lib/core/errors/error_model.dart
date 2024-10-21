import '../api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.statusCode],
      errorMessage: jsonData[ApiKey.message],
    );
  }
}
