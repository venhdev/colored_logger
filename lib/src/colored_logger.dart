import 'package:colored_logger/src/extensions.dart';
import 'package:colored_logger/src/utils.dart';

import 'ansi.dart';

void _defaultConsoleWriter(String text) => print(text);
typedef Writer = void Function(String text);

void showAnsiInfo() => print(ansiInfo());

/// A simple yet powerful colored logging utility for Dart and Flutter applications.
///
/// This class provides static methods for logging messages with different colors
/// and styles using ANSI escape codes. It's designed to enhance console output
/// with color-coded log levels for better readability.
class ColoredLogger {
  /// Private constructor to prevent instantiation
  ColoredLogger._();

  /// Logs an informational message in blue color.
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.info('Server started on port 8080');
  /// ```
  ///
  /// - [message] The message to log
  /// - [prefix] The prefix to add before the message (default: '[INFO] ')
  static void info(String message, {String prefix = '[INFO] '}) {
    colorize(message, styles: [Ansi.blue], prefix: prefix);
  }

  /// Logs a success message in green.
  ///
  /// - [message] The message to log
  /// - [prefix] The prefix to add before the message (default: '[SUCCESS] ')
  static void success(String message, {String prefix = '[SUCCESS] '}) {
    colorize(message, styles: [Ansi.green], prefix: prefix);
  }

  /// Logs a warning message in yellow.
  ///
  /// - [message] The message to log
  /// - [prefix] The prefix to add before the message (default: '[WARNING] ')
  static void warning(String message, {String prefix = '[WARNING] '}) {
    colorize(message, styles: [Ansi.yellow], prefix: prefix);
  }

  /// Logs an error message in red.
  ///
  /// - [message] The message to log
  /// - [prefix] The prefix to add before the message (default: '[ERROR] ')
  static void error(String message, {String prefix = '[ERROR] '}) {
    colorize(message, styles: [Ansi.red], prefix: prefix);
  }

  /// A public method to generate a String that applies ANSI escape codes to colorize the given text.
  ///
  /// This method leverages `StyledString` and `Ansi` for advanced text styling.
  ///
  /// - [input] The text to colorize. Can be a `String` or `StyledString`.
  /// - [styles] Optional list of `Ansi` styles to apply.
  /// - [prefix] An optional prefix to add before the text.
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.colorize(
  ///   'This is a custom message with bold and cyan text.',
  ///   styles: [Ansi.bold, Ansi.cyan],
  ///   prefix: '[STYLED] ',
  ///   printer: print, // You can provide a custom printer function here
  /// );
  /// ```
  static void colorize(
    dynamic input, {
    List<Ansi>? styles,
    String prefix = '',
    Writer? writer,
  }) {
    final String text_ = '$prefix${stringify(input)}';
    if (styles == null || styles.isEmpty || !isSupportAnsi) {
      _print(text_, writer: writer);
      return;
    }

    final StyledString styledText = StyledString(text_, styles);
    _print(styledText(), writer: writer);
  }
}

void _print(String text, {Writer? writer}) {
  (writer ?? _defaultConsoleWriter)(text);
}
