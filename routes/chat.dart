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
          print('NEXT ${next}');
          channel.sink.add(next.toString());
        },
      );
    // Listen from client.
    channel.stream.listen(
      (event) {
        print(event);
        container.read(chatProvider.notifier).addChat();
      },
      onDone: () => channel.sink.done,
    );
  });
  return handler(context);
}
