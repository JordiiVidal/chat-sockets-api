import 'dart:convert';
import 'package:chat_sockets_api/chat/provider.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:riverpod/riverpod.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final container = context.read<ProviderContainer>()
      ..listen(
        chatProvider,
        (_, next) {
          channel.sink.add(jsonEncode(next));
        },
      );
    // Listen from client.
    channel.stream.listen(
      (event) {
        switch (event) {
          case 'add_chat':
            container.read(chatProvider.notifier).addChat('test');
            break;
          case 'add_message':
            container.read(chatProvider.notifier).addMessage('1', 'test');
            break;
        }
      },
      onDone: () => channel.sink.done,
    );
  });
  return handler(context);
}
