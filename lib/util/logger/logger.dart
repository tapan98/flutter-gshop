import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );

  static void debug(message) {
    _logger.d(message);
  }

  static void warning(message) {
    _logger.w(message);
  }

  static void error(message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }

  static void info(message) {
    _logger.i(message);
  }
}