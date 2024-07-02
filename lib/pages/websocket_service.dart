import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel channel;

  void connect(String url) {
    channel = WebSocketChannel.connect(Uri.parse(url));
  }

  void sendMessage(String message) {
    channel.sink.add(message);
  }

  void disconnect() {
    channel.sink.close();
  }

  Stream get stream => channel.stream;
}
