class Note {
  int id;
  String title;
  String description;
  String date;
  int priority;

  Note({
    this.id,
    this.title,
    this.description,
    this.date,
    this.priority,
  });
  // Note.withId({
  //   this.id,
  //   this.title,
  //   this.description,
  //   this.date,
  //   this.priority,
  // });

  int get getId => id;

  String get getTitle => title;

  set setTitle(String title) => this.title = title;

  String get getDescription => description;

  set setDescription(String description) => this.description = description;

  String get getDate => date;

  set setDate(String date) => this.date = date;

  int get getPriority => priority;

  set setPriority(int priority) => this.priority = priority;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'priority': priority,
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      priority: map['priority'],
    );
  }
}
