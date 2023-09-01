class ToDoModelData {
  String? title;
  String? data;

  ToDoModelData({
    this.title,
    this.data,
  });

  ToDoModelData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    data = json['data'];
  }
}
