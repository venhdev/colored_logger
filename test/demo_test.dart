import 'package:colored_logger/colored_logger.dart';
import 'package:test/test.dart';

void main() {
  group('Colored Logger Demonstrations', () {
    test('Basic Log Levels', () {
      print('\n--- Basic Log Levels ---');
      ColoredLogger.info('This is an info message');
      ColoredLogger.success('Operation completed successfully');
      ColoredLogger.warning('This is a warning message');
      ColoredLogger.error('An error occurred');
      ColoredLogger.colorize(
        'Custom message with color name',
        styles: [Ansi.magenta],
        prefix: '[CUSTOM] ',
      );
    });

    test('String Extensions - Text Formatting', () {
      print('\n--- String Extensions - Text Formatting ---');
      print('Bold text'.bold());
      print('Italic text'.italic());
      print('Underlined text'.underline());
      print('Strikethrough text'.strikethrough());
      print('Blinking text'.slowBlink());
      print('Reversed colors'.inverse());
      print('Text with background'.bgGreen());
    });

    test('String Extensions - Extended Colors', () {
      print('256 color foreground'.fg256(27)());
      print('256 color background'.bg256(27)());
      print('RGB color foreground'.fgRgb(255, 100, 0)());
      print('RGB color background'.bgRgb(255, 100, 0)());
    });

    test('Combined Styles', () {
      print('\n--- Combined Styles ---');
      print('Bold Italic Underlined Red Text'.bold.italic.underline.red());
      print('Yellow Text Bold'.yellow.bold());
      print('Rainbow Text Example'.rainbow());
    });
  });
}
