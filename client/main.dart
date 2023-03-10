import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

void main() {
  final uri = Uri.parse('ws://localhost:8080/chat');
  final channel = WebSocketChannel.connect(uri);
  // Listen
  channel.stream.listen(
    (event) {
      print(event);
    },
  );
  // Send
  channel.sink.add('add_chat');
  channel.sink.add('add_message');
  channel.sink.add('add_message');
  channel.sink.add('add_message');
  channel.sink.add('add_message');
  // Close
  channel.sink.close();
}
