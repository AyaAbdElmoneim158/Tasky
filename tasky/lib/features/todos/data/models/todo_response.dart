class TodoResponse {
  final String? id;
  final String? image;
  final String? title;
  final String? desc;
  final String? priority;
  final String? status;
  final String? user;
  final String? createdAt;
  final String? updatedAt;

  TodoResponse({
    this.id,
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      id: json['_id'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      user: json['user'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'status': status,
      'user': user,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
