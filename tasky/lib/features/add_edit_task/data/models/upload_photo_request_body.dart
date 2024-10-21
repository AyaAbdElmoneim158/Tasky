class UploadPhotoRequestBody {
  final String filePath;
  UploadPhotoRequestBody({required this.filePath});

  factory UploadPhotoRequestBody.fromJson(Map<String, dynamic> json) {
    return UploadPhotoRequestBody(
      filePath: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': filePath,
    };
  }
}
