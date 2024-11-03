class AddEditTodoRequestBody {
  final String? image;
  final String? title;
  final String? desc;
  final String? priority;
  final String? dueDate;

  AddEditTodoRequestBody({
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.dueDate,
  });

  factory AddEditTodoRequestBody.fromJson(Map<String, dynamic> json) {
    return AddEditTodoRequestBody(
      image: json['image'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      priority: json['priority'] as String?,
      dueDate: json['dueDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'dueDate': dueDate,
    };
  }
}
