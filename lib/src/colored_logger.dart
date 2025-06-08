import 'package:colored_logger/src/extensions.dart';
import 'package:colored_logger/src/utils.dart';

import 'ansi.dart';

void _defaultConsoleWriter(String text) => print(text);

void showAnsiInfo() => print(ansiInfo());

/// A public method to generate a String that applies ANSI escape codes to colorize the given text.
///
/// This method leverages `StyledString` and `Ansi` for advanced text styling.
///
/// - [input] The text to colorize.
/// - [ansi] The ANSI code to apply to the text.
/// - [prefix] An optional prefix to add before the text.
/// - [colored] If `false`, the text will not be colored.
///
/// Example:
/// ```dart
/// String coloredString = colorize('Hello, World!', Ansi.red.bold);
/// print(coloredString);
/// ```
String colorize(
  dynamic input,
  Ansi ansi, {
  String prefix = '',
  bool colored = true,
}) {
  final String str_ = '$prefix${stringify(input)}';
  if (!colored || !isSupportAnsi) return str_;

  final StyledString styledText = StyledString(str_, [ansi]);
  return styledText.colorize(colored);
}

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

  /// This method allows for complete customization of the log message appearance.
  ///
  /// You can specify either a color name or provide specific ANSI codes. If both [colorName] and [ansiCodes] are provided, [ansiCodes] will take precedence.
  ///
  /// - [input] The message to log
  /// - [prefix], [suffix] For customizing the prefix and suffix of the message (default: '')
  /// - [colorName] The name of the color to use (e.g., 'red', 'green', 'blue')
  /// - [ansiCodes] List of ANSI codes to apply (takes precedence over colorName if provided)
  /// - [chunkSize] The size of each chunk for long messages (default: null), must be greater than 0
  ///  - [writer] The function to write the message (default: print)
  /// - [colored] If false, the message will not be colored (default: true)
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.custom('Styled message',
  ///     ansiCodes: [Ansi.bold, Ansi.cyan],
  ///     prefix: '[STYLED] ');
  /// ```
  ///

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
  /// );
  /// ```
  static void colorize(
    dynamic input, {
    List<Ansi>? styles,
    String prefix = '',
  }) {
    final String text_ = '$prefix${stringify(input)}';
    if (styles == null || styles.isEmpty || !isSupportAnsi) {
      _defaultConsoleWriter(text_);
      return;
    }

    final StyledString styledText = StyledString(text_, styles);
    _defaultConsoleWriter(styledText());
  }
}
