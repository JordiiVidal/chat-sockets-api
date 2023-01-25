import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'chat.g.dart';

/// Class Chat
@immutable
@JsonSerializable()
class Chat extends Equatable {
  /// Constructor
  Chat({
    required this.id,
    required this.name,
    this.messsages = const [],
  });

  /// Chat id
  final String id;

  /// Chat name
  final String name;

  /// Chat messages
  final List<String> messsages;

  /// Add message
  void addMessage(String msg) {
    messsages.add(msg);
  }

  /// Returns a copy of this todo with the given values updated.
  Chat copyWith({
    String? id,
    String? name,
    List<String>? messages,
  }) {
    return Chat(
      id: id ?? this.id,
      name: name ?? this.name,
      messsages: messsages,
    );
  }

  /// Deserializes the given `Map<String, dynamic>` into a [Chat].
  static Chat fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  /// Converts this [Chat] into a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() => _$ChatToJson(this);

  @override
  List<Object?> get props => [id, name, messsages];
}
