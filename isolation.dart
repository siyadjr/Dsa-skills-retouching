import 'dart:developer';
import 'dart:isolate';

void main() async {
  mainThread();
}

void mainThread() async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(bigtask, receivePort.sendPort);
  for (int i = 0; i < 4; i++) {
    log('its working properly');
  }
  receivePort.listen((value) {
    log('this is the answer $value');
  });
}

bigtask(SendPort port) async {
  int sum1 = 0;
  for (int value = 0; value <= 20000000000; value++) {}
  port.send(sum1);
}
