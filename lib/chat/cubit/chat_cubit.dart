import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:chat_sockets_api/data/data.dart';
import 'package:chat_sockets_api/models/chat.dart';

/// Chat Cubit
class ChatCubit extends BroadcastCubit<Chat> {
  /// Constructor
  ChatCubit() : super(chats[0]);

  /// Add message chat
  void addMessage(String messsage) {
    state.addMessage(messsage);
    emit(state);
  }
}
