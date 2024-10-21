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
      experienceYears: json['experience_years'] as int?,
      phoneNumber: json['username'] as String?,
      displayName: json['display_name'] as String?,
      level: json['level'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'experience_years': experienceYears,
      'username': phoneNumber,
      'display_name': displayName,
      'level': level,
      'address': address,
    };
  }
}
