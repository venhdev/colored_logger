import 'package:colored_logger/src/extensions.dart';
import 'package:colored_logger/src/utils.dart';

import 'ansi.dart';
import 'ansi_code.dart';
import 'ansi_colors.dart';

void _defaultConsoleWriter(String text) => print(text);

/// A public method to generate a String that applies ANSI escape codes to colorize the given text.
///
/// This method leverages `StyledString` and `Ansi` for advanced text styling.
///
/// - [input] The text to colorize.
/// - [ansi] The ANSI code to apply to the text.
/// - [prefix] An optional prefix to add before the text.
/// - [suffix] An optional suffix to add after the text.
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
  String suffix = '',
  bool colored = true,
}) {
  final String str_ = '$prefix${stringify(input)}$suffix';
  if (!colored || !isSupportAnsi) return str_;

  final StyledString styledText = StyledString(str_, [ansi]);
  return styledText.toString();
}

/// A public method to generate a String that applies ANSI escape codes to colorize the given text before printing it to console
/// - [text] is the text to colorize, maybe a function that returns a String
/// - [ansiCodes] List of ANSI codes to apply to the [text]. Specify the [ansiStyle] if you want to use a predefined style, it takes precedence over [ansiCodes]
/// - [forwardTo] List of ANSI codes to forward to after the text, it can be used to return to the previous color for multiple styles in the same line
/// - [prefix] The prefix to add before the text (default: '')
/// - [suffix] The suffix to add after the text (default: '')
/// - [colored] If false, the text will not be colored (default: true)
///
@Deprecated('Use `colorize` instead. This will be removed in future versions.')
String colorizeText(
  dynamic text, {
  List<String> ansiCodes = const [AnsiCode.normal],
  List<String> forwardTo = const [AnsiCode.normal],
  String? ansiStyle,
  String prefix = '',
  String suffix = '',
  bool colored = true,
}) {
  final String text_ = '$prefix${stringify(text)}$suffix';
  if (!colored || !isSupportAnsi) return text_;

  final List<String> lines = text_.split('\n');
  final String ansiStyle_ = ansiStyle ?? ansiCodes.join('');
  final String forwardAnsi = forwardTo.join('');

  if (lines.length == 1) return '$ansiStyle_$text_$forwardAnsi';

  final String coloredText =
      lines.map((line) => '$ansiStyle_$line$forwardAnsi').join('\n');
  return coloredText;
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
    custom(message, prefix: prefix, ansiCodes: AnsiColors.info);
  }

  /// Logs a success message in green color.
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.success('Operation completed successfully');
  /// ```
  ///
  /// - [message] The message to log
  /// - [prefix] The prefix to add before the message (default: '[SUCCESS] ')
  static void success(String message, {String prefix = '[SUCCESS] '}) {
    custom(message, prefix: prefix, ansiCodes: AnsiColors.success);
  }

  /// Logs a warning message in yellow color.
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.warning('Cache is almost full');
  /// ```
  ///
  /// - [message] The message to log
  /// - [prefix] The prefix to add before the message (default: '[WARNING] ')
  static void warning(String message, {String prefix = '[WARNING] '}) {
    custom(message, prefix: prefix, ansiCodes: AnsiColors.warning);
  }

  /// Logs an error message in red color.
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.error('Failed to connect to database');
  /// ```
  ///
  /// - [message] The message to log
  /// - [prefix] The prefix to add before the message (default: '[ERROR] ')
  static void error(String message, {String prefix = '[ERROR] '}) {
    custom(message, prefix: prefix, ansiCodes: AnsiColors.error);
  }

  /// This method allows for complete customization of the log message appearance.
  ///
  /// You can specify either a color name or provide specific ANSI codes. If both [colorName] and [ansiCodes] are provided, [ansiCodes] will take precedence.
  ///
  /// - [message] The message to log
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
  ///     ansiCodes: [AnsiCode.bold, AnsiCode.cyan],
  ///     prefix: '[STYLED] ');
  /// ```
  ///
  static void custom(
    dynamic message, {
    String prefix = '',
    String suffix = '',
    String colorName = 'normal',
    List<String>? ansiCodes,
    int? chunkSize,
    void Function(String)? writer,
    bool colored = true,
  }) {
    final String ansiStyle = ansiCodes?.join('') ??
        AnsiCode.getColorByName(colorName) ??
        AnsiCode.normal;

    if (chunkSize == null) {
      (writer ?? _defaultConsoleWriter)(colorizeText(
        message,
        ansiStyle: ansiStyle,
        prefix: prefix,
        suffix: suffix,
        colored: colored,
      ));
    } else {
      if (chunkSize <= 0) {
        throw ArgumentError('chunkSize must be greater than 0');
      }

      // Split the message into chunks
      final String messageStr = stringify(message);
      final List<String> chunks = [];
      for (var i = 0; i < messageStr.length; i += chunkSize) {
        final end = (i + chunkSize < messageStr.length)
            ? i + chunkSize
            : messageStr.length;
        chunks.add(messageStr.substring(i, end));
      }

      // Process each chunk with color and multiline handling
      for (final String chunk in chunks) {
        (writer ?? _defaultConsoleWriter)(colorizeText(chunk,
            ansiStyle: ansiStyle,
            prefix: prefix,
            suffix: suffix,
            colored: colored));
      }
    }
  }
}
