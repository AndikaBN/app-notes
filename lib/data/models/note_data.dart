import 'dart:convert';

class Note {
  final int? id;
  final String title;
  final String content;
  final DateTime creatAt;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.creatAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'creatAt': creatAt.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      creatAt: DateTime.fromMillisecondsSinceEpoch(int.parse(map['creatAt'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
