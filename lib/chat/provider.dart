import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

/// Uuid
const uuid = Uuid();

/// Provider
final chatProvider = StateNotifierProvider<ChatsNotifier, List<String>>(
  (ref) => ChatsNotifier(),
);

/// Class
class ChatsNotifier extends StateNotifier<List<String>> {
  /// Constructor
  ChatsNotifier() : super([]);

  /// Client add message
  void addChat() {
    state = [...state, 'dasdas'];
  }
}
