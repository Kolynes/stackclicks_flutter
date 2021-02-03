import 'dart:isolate';

abstract class BidirectionalIsolate {
  final receivePort = ReceivePort();
  SendPort clientSendPort;

  didReceiveData(dynamic data);

  BidirectionalIsolate(SendPort sendPort) {
    clientSendPort = sendPort;
    receivePort.listen(didReceiveData);
    clientSendPort.send(receivePort.sendPort);
  }
}