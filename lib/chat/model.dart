/// Classs
class Chat {
  /// Constructor
  Chat({
    required this.id,
    required this.name,
    required this.messsages,
  });

  /// Chat id
  String id;

  /// Chat name
  String name;

  /// Chat messages
  List<String> messsages;

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
}
