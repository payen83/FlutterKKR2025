class Task {
  Task(this.title, {this.done = false});

  final String title;
  bool done;

  Map<String, dynamic> toJson() => {
    'title': title,
    'done': done
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    json['title'],
    done: json['done'] ?? false
  );

}