import 'package:colored_logger/colored_logger.dart';
import 'package:colored_logger/src/ansi.dart';
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
      ColoredLogger.info(colorize('[DEBUG] Line 1\nLine 2\nLine 3', Ansi.green));
    });

    test('colored = false', () {
      final List<String> capturedOutput = [];
      ColoredLogger.info(
        'This should not be colored',
        writer: (msg) {
          capturedOutput.add(msg);
          print(msg); // Print to the standard output for manual verification
        },
      );
      expect(capturedOutput.isNotEmpty, true);
      expect(capturedOutput[0].contains('\x1B'), false);
    });
  });

  /// Print Long String

  group('Print Long String', () {
    test('A * 10,000', () {
      final String longString = 'A' * 10000; // 10,000 'A's
      ColoredLogger.info(colorize('$longString--Print Long String--END', Ansi.green), writer: print);
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
      ColoredLogger.info(colorize('[CUSTOM] Custom message with color name', Ansi.magenta));

      // Custom colored message with ANSI codes
      ColoredLogger.info(colorize('[STYLED] Custom message with ANSI codes', Ansi.bold + Ansi.cyan));

      // Using quick combine Ansi styles
      ColoredLogger.info(colorize('Bold Red Background Green', Ansi.bold + Ansi.red + Ansi.bgGreen));
      ColoredLogger.info(colorize('Underlined Yellow on Blue', Ansi.underline + Ansi.yellow + Ansi.bgBlue));

      // Using different text styles
      ColoredLogger.info(colorize('Bold text', Ansi.bold));
      ColoredLogger.info(colorize('Italic text', Ansi.italic));
      ColoredLogger.info(colorize('Underlined text', Ansi.underline));
      ColoredLogger.info(colorize('Strikethrough text', Ansi.strikethrough));
      ColoredLogger.info(colorize('Blinking text', Ansi.blink));
      ColoredLogger.info(colorize('Reversed colors', Ansi.reverse));

      // Using background colors
      ColoredLogger.info(colorize('Text with background', Ansi.black + Ansi.bgYellow));

      // Using 256 colors (8-bit)
      ColoredLogger.info(colorize('256 color foreground', Ansi.fg256(39)));
      ColoredLogger.info(colorize('256 color background', Ansi.white + Ansi.bg256(39)));

      // Using RGB true colors
      ColoredLogger.info(colorize('RGB color foreground', Ansi.fgRGB(255, 100, 50)));
      ColoredLogger.info(colorize('RGB color background', Ansi.black + Ansi.bgRGB(255, 100, 50)));

      // Using Ansi predefined styles
      ColoredLogger.info(colorize('Error style', Ansi.red));
      ColoredLogger.info(colorize('Success style', Ansi.green));
      ColoredLogger.info(colorize('Warning style', Ansi.yellow));
      ColoredLogger.info(colorize('Info style', Ansi.blue));
      ColoredLogger.info(colorize('Debug style', Ansi.gray));

      // Using Ansi semantic styles
      ColoredLogger.info(colorize('Primary style', Ansi.blue));
      ColoredLogger.info(colorize('Secondary style', Ansi.gray));
      ColoredLogger.info(colorize('Highlight style', Ansi.yellow));
      ColoredLogger.info(colorize('Alert style', Ansi.red));
      ColoredLogger.info(colorize('Link style', Ansi.cyan));
      ColoredLogger.info(colorize('Code style', Ansi.magenta));
      ColoredLogger.info(colorize('Header style', Ansi.bold));

      // Using Ansi named colors
      ColoredLogger.info(colorize('Coral color', Ansi.coral));
      ColoredLogger.info(colorize('Gold color', Ansi.gold));
      ColoredLogger.info(colorize('Teal color', Ansi.teal));
      ColoredLogger.info(colorize('Deep sky blue color', Ansi.deepSkyBlue));
      ColoredLogger.info(colorize('Hot pink color', Ansi.hotPink));
      ColoredLogger.info(colorize('Purple color', Ansi.purple));

      // Test Ansi style combination and paint method
      expect(Ansi.s().bold.red.bgGreen.paint('text'), equals('\x1B[1;31;42mtext\x1B[22;39;49m'));

      // Test rainbow style
      final rainbowText = 'Rainbow'.rainbow().paint();
      expect(rainbowText, contains('\x1B[31mR\x1B[39m'));
      expect(rainbowText, contains('\x1B[33ma\x1B[39m'));
      expect(rainbowText, contains('\x1B[32mi\x1B[39m'));
      expect(rainbowText, contains('\x1B[36mn\x1B[39m'));
      expect(rainbowText, contains('\x1B[34mb\x1B[39m'));
      expect(rainbowText, contains('\x1B[35mo\x1B[39m'));
      expect(rainbowText, contains('\x1B[31mw\x1B[39m'));
    });
  });
}
