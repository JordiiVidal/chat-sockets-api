import 'package:chat_sockets_api/chat/cubit/chat_cubit.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    // A new client has connected to our server.
    final cubit = context.read<ChatCubit>()..subscribe(channel);
    // Send a message to the client.
    channel.sink.add('${cubit.state}');
    // Listen for messages from the client.
    channel.stream.listen(
      (event) {
        switch (event) {
          case '__addmessage__':
            cubit.addMessage('hola');
            break;
          default:
            break;
        }
      },
      onDone: () => cubit.unsubscribe(channel),
    );
  });
  return handler(context);
}
