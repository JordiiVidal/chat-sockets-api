import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:chat_sockets_api/models/chat.dart';
import 'package:uuid/uuid.dart';

/// Id
const uuid = Uuid();

/// Chat Cubit
class ChatCubit extends BroadcastCubit<Chat> {
  /// Constructor
  ChatCubit()
      : super(Chat(id: uuid.v4(), name: 'Test 1', messsages: const ['hello']));

  /// Add message chat
  void addMessage() {
    print(state);
    emit(state);
  }
}
