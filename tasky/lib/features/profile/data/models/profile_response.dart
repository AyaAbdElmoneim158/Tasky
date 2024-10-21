import '../../../../core/api/end_points.dart';

class ProfileResponse {
  final int? experienceYears;
  final String? phoneNumber;
  final String? displayName;
  final String? level;
  final String? address;

  ProfileResponse({
    this.experienceYears,
    this.phoneNumber,
    this.displayName,
    this.level,
    this.address,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      experienceYears: json[ApiKey.experienceYears] as int?,
      phoneNumber: json[ApiKey.username] as String?,
      displayName: json[ApiKey.displayName] as String?,
      level: json[ApiKey.level] as String?,
      address: json[ApiKey.address] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.experienceYears: experienceYears,
      ApiKey.username: phoneNumber,
      ApiKey.displayName: displayName,
      ApiKey.level: level,
      ApiKey.address: address,
    };
  }
}
