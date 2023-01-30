import 'dart:convert';

class Message {
  /// Constructor
  const Message({
    required this.id,
    required this.idUser,
    required this.messsage,
  });

  /// [Message] id
  final String id;

  /// [Message] name
  final String idUser;

  /// [Message] message
  final String messsage;

  Message copyWith({
    String? id,
    String? idUser,
    String? messsage,
  }) {
    return Message(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      messsage: messsage ?? this.messsage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUser': idUser,
      'messsage': messsage,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      idUser: map['idUser'] as String,
      messsage: map['messsage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Message(id: $id, idUser: $idUser, messsage: $messsage)';
}
