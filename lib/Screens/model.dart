
class MemberList {
  int? userId;
  int? id;
  String? title;
  bool? completed;
  String? description;

  MemberList({this.userId, this.id, this.title, this.completed, this.description});

  MemberList.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    data['description'] = this.description;

    return data;
  }

  @override
  String toString() {
    return 'MemberList{userId: $userId, id: $id, title: $title, completed: $completed, description: $description}';
  }
}