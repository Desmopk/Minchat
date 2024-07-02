import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
class WebsocketService {
  final WebSocketChannel channel ;
  WebsocketService(String url) : channel = IOWebSocketChannel.connect(url);

  void sendMessage(String message)
  {
  channel.sink.add(message);
  }
  void dispose()
  {
    channel.sink.close();
  }

}