class EditTaskRequestBody {
  final String? image;
  final String? title;
  final String? desc;
  final String? status;
  final String? user;
  final String? priority;
  final String? dueDate;

  EditTaskRequestBody({
    this.image,
    this.title,
    this.desc,
    this.status,
    this.user,
    this.priority,
    this.dueDate,
  });

  factory EditTaskRequestBody.fromJson(Map<String, dynamic> json) {
    return EditTaskRequestBody(
      image: json['image'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      status: json['status'] as String?,
      user: json['user'] as String?,
      priority: json['priority'] as String?,
      dueDate: json['dueDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'status': status,
      'user': user,
      'priority': priority,
      'dueDate': dueDate,
    };
  }
}
