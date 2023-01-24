import 'package:chat_sockets_api/chat/chat_provider.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) => handler.use(chatProvider);
