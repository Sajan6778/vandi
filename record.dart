import 'dart:async';
import 'dart:io';

void main() async {
  // Create a StreamController
  final controller = StreamController<String>();

  // Create a subprocess and inherit stdout and stderr
  final process = await Process.start(
    'python',
    ['record_copy.py'],
    mode: ProcessStartMode.inheritStdio,
  );

  // Pass the controller stream to the Python process
  process.stdout.listen((List<int> data) {
    final message = String.fromCharCodes(data);
    print('Received from Python: $message');
    // Add the received message to the stream
    controller.add(message);
  });

  // Send a command to start recording
  controller.add('start');

  // Wait for a while
  await Future.delayed(Duration(seconds: 5));

  // Send a command to stop recording
  controller.add('stop');

  // Close the stream controller
  controller.close();

  // Wait for the process to exit
  await process.exitCode;
}
