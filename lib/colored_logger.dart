import 'package:colored_logger/ansi_color.dart';

class ColoredLogger {
  static void info(String message) {
    custom(message, AnsiColor.blue, prefix: '[INFO] ');
  }

  static void success(String message) {
    custom(message, AnsiColor.green, prefix: '[SUCCESS] ');
  }

  static void warning(String message) {
    custom(message, AnsiColor.yellow, prefix: '[WARNING] ');
  }

  static void error(String message) {
    custom(message, AnsiColor.red, prefix: '[ERROR] ');
  }

  static void custom(String message, String ansiColorCode, {String prefix = ''}) {
    print('$ansiColorCode$prefix$message${AnsiColor.reset}');
  }
}
