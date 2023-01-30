import 'dart:convert';
import 'package:models_chat/models/message.dart';

class Chat {
  /// Constructor
  const Chat({
    required this.id,
    required this.name,
    required this.messsages,
  });

  /// [Chat] id
  final String id;

  /// [Chat] name
  final String name;

  /// [Chat] messages
  final List<Message> messsages;

  Chat copyWith({
    String? id,
    String? name,
    List<Message>? messsages,
  }) {
    return Chat(
      id: id ?? this.id,
      name: name ?? this.name,
      messsages: messsages ?? this.messsages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'messsages': messsages.map((x) => x.toMap()).toList(),
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map['id'] as String,
      name: map['name'] as String,
      messsages: List<Message>.from(
        (map['messsages'] as List<int>).map<Message>(
          (x) => Message.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) =>
      Chat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Chat(id: $id, name: $name, messsages: $messsages)';
}
