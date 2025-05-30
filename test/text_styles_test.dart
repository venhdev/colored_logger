import 'package:colored_logger/colored_logger.dart';
import 'package:test/test.dart';

void main() {
  group('Text Styles', () {
    test('normal style', () {
      ColoredLogger.custom('Test normal style text',
          ansiCodes: [AnsiCode.normal], prefix: '[NORMAL] ');
    });

    test('bold style', () {
      ColoredLogger.custom('Test bold style text',
          ansiCodes: [AnsiCode.bold], prefix: '[BOLD] ');
    });

    test('dim style', () {
      ColoredLogger.custom('Test dim style text',
          ansiCodes: [AnsiCode.dim], prefix: '[DIM] ');
    });

    test('italic style', () {
      ColoredLogger.custom('Test italic style text',
          ansiCodes: [AnsiCode.italic], prefix: '[ITALIC] ');
    });

    test('underline style', () {
      ColoredLogger.custom('Test underline style text',
          ansiCodes: [AnsiCode.underline], prefix: '[UNDERLINE] ');
    });

    test('blink style', () {
      ColoredLogger.custom('Test blink style text',
          ansiCodes: [AnsiCode.blink], prefix: '[BLINK] ');
    });

    test('reverse style', () {
      ColoredLogger.custom('Test reverse style text',
          ansiCodes: [AnsiCode.reverse], prefix: '[REVERSE] ');
    });

    test('hidden style', () {
      ColoredLogger.custom('Test hidden style text',
          ansiCodes: [AnsiCode.hidden], prefix: '[HIDDEN] ');
    });

    test('strikethrough style', () {
      ColoredLogger.custom('Test strikethrough style text',
          ansiCodes: [AnsiCode.strikethrough], prefix: '[STRIKETHROUGH] ');
    });

    test('combined text styles', () {
      ColoredLogger.custom('Test bold and italic text',
          ansiCodes: [AnsiCode.bold, AnsiCode.italic],
          prefix: '[BOLD+ITALIC] ');

      ColoredLogger.custom('Test bold, italic and underline text',
          ansiCodes: [AnsiCode.bold, AnsiCode.italic, AnsiCode.underline],
          prefix: '[BOLD+ITALIC+UNDERLINE] ');

      ColoredLogger.custom('Test bold with color',
          ansiCodes: [AnsiCode.bold, AnsiCode.blue], prefix: '[BOLD+BLUE] ');
    });
  });
}
