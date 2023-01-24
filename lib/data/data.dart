import 'package:chat_sockets_api/models/chat.dart';
import 'package:uuid/uuid.dart';

/// uuid
const uuid = Uuid();

/// Chats
final List<Chat> chats = [
  Chat(id: uuid.v4(), name: 'Test 1', messsages: ['hello']),
  Chat(id: uuid.v4(), name: 'Test 2', messsages: ['hello']),
];
