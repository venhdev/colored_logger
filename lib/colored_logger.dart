import 'package:colored_logger/ansi_code.dart';
import 'package:flutter/foundation.dart' show debugPrint;

/// A public method to generate a String that applies ANSI escape codes to colorize the given text before printing it to console
///
/// [forwardTo] used to forward ANSI codes to the next line. Commonly used for multiple colorization, passing the last ANSI code to return the original color.
String colorizeText(
  String text, {
  List<String>? ansiCode,
  List<String> forwardTo = const [AnsiCode.normal],
}) {
  final String flattenAnsiCode_ = ansiCode?.join('') ?? AnsiCode.normal;
  final String continueAnsi = forwardTo.join('');
  final List<String> lines = text.split('\n');
  if (lines.length == 1) {
    return '$flattenAnsiCode_$text$continueAnsi';
  }
  final String coloredText =
      lines.map((line) => '$flattenAnsiCode_$line$continueAnsi').join('\n');
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
    int chunkSize = 800,
  }) {
    final String? flattenAnsiCode_ = ansiCode?.join('');
    final String ansiColorDecoded = flattenAnsiCode_ ??
        AnsiCode.getColorByCode(colorCode) ??
        AnsiCode.normal;

    final List<String> chunks = [];
    for (var i = 0; i < message.length; i += chunkSize) {
      final end =
          (i + chunkSize < message.length) ? i + chunkSize : message.length;
      chunks.add(message.substring(i, end));
    }

    // Process each chunk with color and multiline handling
    for (final chunk in chunks) {
      String coloredChunk;
      if (chunk.contains('\n')) {
        final lines = chunk.split('\n');
        coloredChunk = lines
            .map((line) => '$ansiColorDecoded$prefix$line${AnsiCode.reset}')
            .join('\n');
      } else {
        coloredChunk = '$ansiColorDecoded$prefix$chunk${AnsiCode.reset}';
      }
      debugPrint(coloredChunk);
    }
  }
}
