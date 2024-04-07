// Packages
import 'dart:isolate';

// Program files
import 'api.dart';

// IsolateParser class
class IsolateParser<T> {
  // JSON object
  final Map<String, dynamic> json;

  // Coverter function
  ResponseConverter<T> converter;

  // IsolateParser class constructor
  IsolateParser(this.json, this.converter);

  // Function to parse in the background
  Future<T> parseInBackground() async {
    // Port for receiving messages
    final port = ReceivePort();

    // Spanws a new isolate
    await Isolate.spawn(_parseListOfJson, port.sendPort);

    // Waits for the first message from the port
    final result = await port.first;

    // Return result as type T
    return result as T;
  }

  // Function to parse Json list
  Future<T> _parseListOfJson(SendPort sendPort) async {
    // Sets result to the result of the passed converter function
    final result = converter(json);

    // Exits the isolate and sends back the result to the main isolate via sendPort
    Isolate.exit(sendPort, result);
  }
}
