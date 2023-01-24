import 'package:chat_sockets_api/chat/cubit/chat_cubit.dart';
import 'package:dart_frog/dart_frog.dart';

final _chat = ChatCubit();
/// Provider
final chatProvider = provider<ChatCubit>((context) => _chat);
