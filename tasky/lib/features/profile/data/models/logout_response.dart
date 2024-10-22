import '../../../../core/api/end_points.dart';

class LogoutResponse {
  final bool success;

  LogoutResponse({
    required this.success,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(
      success: json[ApiKey.success] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.success: success,
    };
  }
}
