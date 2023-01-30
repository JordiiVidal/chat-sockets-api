import 'package:models_chat/models/chat.dart';
import 'package:models_chat/models/message.dart';
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
    final chat = Chat(id: uuid.v4(), name: name, messsages: const []);
    state = [...state, chat];
  }

  /// Add message
  void addMessage(String chatId, String txt) {
    final message = Message(id: uuid.v4(), idUser: uuid.v4(), messsage: txt);
    state = [
      for (final chat in state)
        if (chat.id == chatId)
          chat.copyWith(messsages: [...chat.messsages, message])
        else
          chat
    ];
  }
}
