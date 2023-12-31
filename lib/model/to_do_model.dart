class ToDoModelData {
  String? title;
  String? content;
  String? time;

  ToDoModelData({
    this.title,
    this.content,
    this.time,
  });

  ToDoModelData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    time = json['time'];
  }

  get toJson => null;
  Map<String, dynamic> tojson() => {
        "title": title,
        "content": content,
        "time": time,
      };
  // ToDoModelData.tojson(Map<String, dynamic> json) {
  //   title = json['title'];
  //   content = json['content'];
  //   time = json['time'];
  // }
}
