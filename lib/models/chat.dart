/// Class Chat
class Chat {
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

}
