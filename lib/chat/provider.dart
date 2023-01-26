import 'package:chat_sockets_api/models/chat.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

/// Uuid
const uuid = Uuid();

/// Provider
final chatProvider = StateNotifierProvider<ChatsNotifier, List<Chat>>(
  (ref) => ChatsNotifier(),
);

/// Class
class ChatsNotifier extends StateNotifier<List<Chat>> {
  /// Constructor
  ChatsNotifier() : super([]);

  /// Client add chat
  void addChat(String name) {
    final chat = Chat(id: '1', name: name, messsages: []);
    state = [...state, chat];
  }

  /// Add message
  void addMessage(String chatId, String message) {
    state = [
      for (final chat in state)
        if (chat.id == chatId)
          chat.copyWith(messsages: [...chat.messsages, message])
        else 
          chat
    ];
  }
}
