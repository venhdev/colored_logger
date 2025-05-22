import 'package:colored_logger/ansi_code.dart';

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
  /// @param message The message to log
  /// @param prefix The prefix to add before the message (default: '[INFO] ')
  static void info(String message, {String prefix = '[INFO] '}) {
    custom(message, colorCode: 'blue', prefix: prefix);
  }

  /// Logs a success message in green color.
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.success('Operation completed successfully');
  /// ```
  ///
  /// @param message The message to log
  /// @param prefix The prefix to add before the message (default: '[SUCCESS] ')
  static void success(String message, {String prefix = '[SUCCESS] '}) {
    custom(message, colorCode: 'green', prefix: prefix);
  }

  /// Logs a warning message in yellow color.
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.warning('Cache is almost full');
  /// ```
  ///
  /// @param message The message to log
  /// @param prefix The prefix to add before the message (default: '[WARNING] ')
  static void warning(String message, {String prefix = '[WARNING] '}) {
    custom(message, colorCode: 'yellow', prefix: prefix);
  }

  /// Logs an error message in red color.
  ///
  /// Example:
  /// ```dart
  /// ColoredLogger.error('Failed to connect to database');
  /// ```
  ///
  /// @param message The message to log
  /// @param prefix The prefix to add before the message (default: '[ERROR] ')
  static void error(String message, {String prefix = '[ERROR] '}) {
    custom(message, colorCode: 'red', prefix: prefix);
  }

  /// Logs a custom message with specified color and prefix.
  ///
  /// This method allows for complete customization of the log message appearance.
  /// You can specify either a color code by name or provide specific ANSI codes.
  ///
  /// If both [colorCode] and [ansiCode] are provided, [ansiCode] will take precedence.
  ///
  /// Example with color code:
  /// ```dart
  /// ColoredLogger.custom('Custom message', colorCode: 'magenta', prefix: '[CUSTOM] ');
  /// ```
  ///
  /// Example with ANSI codes:
  /// ```dart
  /// ColoredLogger.custom('Styled message',
  ///     ansiCode: [AnsiCode.bold, AnsiCode.cyan],
  ///     prefix: '[STYLED] ');
  /// ```
  ///
  /// @param message The message to log
  /// @param prefix The prefix to add before the message (default: empty string)
  /// @param colorCode The name of the color to use (e.g., 'red', 'green', 'blue')
  /// @param ansiCode List of ANSI codes to apply (takes precedence over colorCode if provided)
  static void custom(
    String message, {
    String prefix = '',
    String colorCode = 'normal',
    List<String>? ansiCode,
  }) {
    final String? flattenAnsiCode_ = ansiCode?.join('');
    final String ansiColorDecoded = flattenAnsiCode_ ??
        AnsiCode.getColorByCode(colorCode) ??
        AnsiCode.normal;
    print('$ansiColorDecoded$prefix$message${AnsiCode.reset}');
  }
}
