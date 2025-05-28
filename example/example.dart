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
      ansiCodes: [AnsiCode.bold, AnsiCode.cyan], prefix: '[STYLED] ');

  // Using different text styles
  ColoredLogger.custom('Bold text', ansiCodes: [AnsiCode.bold]);
  ColoredLogger.custom('Italic text', ansiCodes: [AnsiCode.italic]);
  ColoredLogger.custom('Underlined text', ansiCodes: [AnsiCode.underline]);
  ColoredLogger.custom('Strikethrough text', ansiCodes: [AnsiCode.strikethrough]);
  ColoredLogger.custom('Blinking text', ansiCodes: [AnsiCode.blink]);
  ColoredLogger.custom('Reversed colors', ansiCodes: [AnsiCode.reverse]);

  // Using background colors
  ColoredLogger.custom('Text with background',
      ansiCodes: [AnsiCode.black, AnsiCode.bgYellow]);
      
  // Using 256 colors (8-bit)
  ColoredLogger.custom('256 color foreground',
      ansiCodes: [AnsiCode.fg256(39)]);
  ColoredLogger.custom('256 color background',
      ansiCodes: [AnsiCode.white, AnsiCode.bg256(39)]);
      
  // Using RGB true colors
  ColoredLogger.custom('RGB color foreground',
      ansiCodes: [AnsiCode.fgRGB(255, 100, 50)]);
  ColoredLogger.custom('RGB color background',
      ansiCodes: [AnsiCode.black, AnsiCode.bgRGB(255, 100, 50)]);
      
  // Using AnsiColors predefined styles
  ColoredLogger.custom('Error style', ansiCodes: AnsiColors.error);
  ColoredLogger.custom('Success style', ansiCodes: AnsiColors.success);
  ColoredLogger.custom('Warning style', ansiCodes: AnsiColors.warning);
  ColoredLogger.custom('Info style', ansiCodes: AnsiColors.info);
  ColoredLogger.custom('Debug style', ansiCodes: AnsiColors.debug);
  
  // Using AnsiColors semantic styles
  ColoredLogger.custom('Primary style', ansiCodes: AnsiColors.primary);
  ColoredLogger.custom('Secondary style', ansiCodes: AnsiColors.secondary);
  ColoredLogger.custom('Highlight style', ansiCodes: AnsiColors.highlight);
  ColoredLogger.custom('Alert style', ansiCodes: AnsiColors.alert);
  ColoredLogger.custom('Link style', ansiCodes: AnsiColors.link);
  ColoredLogger.custom('Code style', ansiCodes: AnsiColors.code);
  ColoredLogger.custom('Header style', ansiCodes: AnsiColors.header);
  
  // Using AnsiColors named colors
  ColoredLogger.custom('Coral color', ansiCodes: [AnsiColors.coral]);
  ColoredLogger.custom('Gold color', ansiCodes: [AnsiColors.gold]);
  ColoredLogger.custom('Teal color', ansiCodes: [AnsiColors.teal]);
  ColoredLogger.custom('Deep sky blue color', ansiCodes: [AnsiColors.deepSkyBlue]);
  ColoredLogger.custom('Hot pink color', ansiCodes: [AnsiColors.hotPink]);
  ColoredLogger.custom('Purple color', ansiCodes: [AnsiColors.purple]);
}
