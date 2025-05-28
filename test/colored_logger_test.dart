import 'package:colored_logger/colored_logger.dart';
import 'package:test/test.dart';

void main() {
  group('Basic Logging Methods', () {
    test('info logging', () {
      ColoredLogger.info('Test info message');
    });

    test('success logging', () {
      ColoredLogger.success('Test success message');
    });

    test('warning logging', () {
      ColoredLogger.warning('Test warning message');
    });

    test('error logging', () {
      ColoredLogger.error('Test error message');
    });

    test('multi lines', () {
      ColoredLogger.custom('Line 1\nLine 2\nLine 3',
          prefix: '[DEBUG] ', colorName: 'green');
    });
  });

  group('Custom Logging with Color Names', () {
    test('normal color name', () {
      ColoredLogger.custom('Test normal message',
          colorName: 'normal', prefix: '[NORMAL] ');
    });

    test('custom color names', () {
      ColoredLogger.custom('Test blue message',
          colorName: 'blue', prefix: '[BLUE] ');
      ColoredLogger.custom('Test red message',
          colorName: 'red', prefix: '[RED] ');
      ColoredLogger.custom('Test green message',
          colorName: 'green', prefix: '[GREEN] ');
      ColoredLogger.custom('Test yellow message',
          colorName: 'yellow', prefix: '[YELLOW] ');
    });

    test('long string', () {
      final String longString = 'A' * 100000; // 100,000 'A's
      ColoredLogger.custom(longString, colorName: 'green', prefix: '[BLUE] ');
    });
  });

  group('Custom Logging with ANSI Codes', () {
    test('single ANSI code', () {
      ColoredLogger.custom('Test bold text',
          ansiCodes: [AnsiCode.bold], prefix: '[BOLD] ');
      ColoredLogger.custom('Test dim text',
          ansiCodes: [AnsiCode.dim], prefix: '[DIM] ');
      ColoredLogger.custom('Test underline text',
          ansiCodes: [AnsiCode.underline], prefix: '[UNDERLINE] ');
    });

    test('background colors', () {
      ColoredLogger.custom('Test bg red',
          ansiCodes: [AnsiCode.bgRed], prefix: '[BG_RED] ');
      ColoredLogger.custom('Test bg blue',
          ansiCodes: [AnsiCode.bgBlue], prefix: '[BG_BLUE] ');
      ColoredLogger.custom('Test bg green',
          ansiCodes: [AnsiCode.bgGreen], prefix: '[BG_GREEN] ');
    });

    test('combined ANSI codes', () {
      ColoredLogger.custom(
        'Test combined styles',
        ansiCodes: [
          AnsiCode.bold,
          AnsiCode.underline,
          AnsiCode.red,
          AnsiCode.bgYellow,
        ],
        prefix: '[COMBINED] ',
      );

      ColoredLogger.custom(
        'Test bright colors',
        ansiCodes: [
          AnsiCode.brightBlue,
          AnsiCode.bgBrightGreen,
        ],
        prefix: '[BRIGHT] ',
      );
    });
  });

  /// Print Long String

  group('Print Long String', () {
    test('long A*100000', () {
      final String longString = 'A' * 100000; // 10,000 'A's
      ColoredLogger.custom('$longString--print-end',
          colorName: 'green', writer: print);
    });
  });

  /// Test on example.dart
  group('Example', () {
    test('example', () {
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
      ColoredLogger.custom('Strikethrough text',
          ansiCodes: [AnsiCode.strikethrough]);
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
      ColoredLogger.custom('Deep sky blue color',
          ansiCodes: [AnsiColors.deepSkyBlue]);
      ColoredLogger.custom('Hot pink color', ansiCodes: [AnsiColors.hotPink]);
      ColoredLogger.custom('Purple color', ansiCodes: [AnsiColors.purple]);
    });
  });
}
