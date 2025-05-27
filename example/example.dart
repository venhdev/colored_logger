import 'package:colored_logger/ansi_code.dart';
import 'package:colored_logger/colored_logger.dart';

void main() {
  // Basic usage with predefined log levels
  ColoredLogger.info('This is an info message');
  ColoredLogger.success('Operation completed successfully');
  ColoredLogger.warning('This is a warning message');
  ColoredLogger.error('An error occurred');

  // Custom colored message with a specific color name
  ColoredLogger.custom('Custom message with color name',
      colorName: 'magenta', prefix: '[CUSTOM] ');

  // Custom colored message with ANSI codes
  ColoredLogger.custom('Custom message with ANSI codes',
      ansiCode: [AnsiCode.bold, AnsiCode.cyan], prefix: '[STYLED] ');

  // Using different text styles
  ColoredLogger.custom('Bold text', ansiCode: [AnsiCode.bold]);
  ColoredLogger.custom('Italic text', ansiCode: [AnsiCode.italic]);
  ColoredLogger.custom('Underlined text', ansiCode: [AnsiCode.underline]);

  // Using background colors
  ColoredLogger.custom('Text with background',
      ansiCode: [AnsiCode.black, AnsiCode.bgYellow]);
}
