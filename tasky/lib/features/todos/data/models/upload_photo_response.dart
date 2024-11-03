class UploadPhotoResponse {
  String? image;
  UploadPhotoResponse({this.image});

  factory UploadPhotoResponse.fromJson(Map<String, dynamic> json) {
    return UploadPhotoResponse(
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
    };
  }
}
