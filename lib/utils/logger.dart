import 'dart:developer' as developer;

class Logger {

  static d(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      time: DateTime.now(),
      name: 'TodoApplication',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
