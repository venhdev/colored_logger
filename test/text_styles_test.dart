import 'package:colored_logger/colored_logger.dart';
import 'package:colored_logger/src/ansi.dart';
import 'package:test/test.dart';

void main() {
  group('Text Styles', () {
    test('normal style', () {
      ColoredLogger.info(colorize('[NORMAL] Test normal style text', Ansi.reset));
    });

    test('bold style', () {
      ColoredLogger.info(colorize('[BOLD] Test bold style text', Ansi.bold));
    });

    test('dim style', () {
      ColoredLogger.info(colorize('[DIM] Test dim style text', Ansi.dim));
    });

    test('italic style', () {
      ColoredLogger.info(colorize('[ITALIC] Test italic style text', Ansi.italic));
    });

    test('underline style', () {
      ColoredLogger.info(colorize('[UNDERLINE] Test underline style text', Ansi.underline));
    });

    test('blink style', () {
      ColoredLogger.info(colorize('[BLINK] Test blink style text', Ansi.blink));
    });

    test('reverse style', () {
      ColoredLogger.info(colorize('[REVERSE] Test reverse style text', Ansi.reverse));
    });

    test('hidden style', () {
      ColoredLogger.info(colorize('[HIDDEN] Test hidden style text', Ansi.hidden));
    });

    test('strikethrough style', () {
      ColoredLogger.info(colorize('[STRIKETHROUGH] Test strikethrough style text', Ansi.strikethrough));
    });

    test('combined text styles', () {
      ColoredLogger.info(colorize('[BOLD+ITALIC] Test bold and italic text', Ansi.bold + Ansi.italic));

      ColoredLogger.info(colorize('[BOLD+ITALIC+UNDERLINE] Test bold, italic and underline text', Ansi.bold + Ansi.italic + Ansi.underline));

      ColoredLogger.info(colorize('[BOLD+BLUE] Test bold with color', Ansi.bold + Ansi.blue));

      ColoredLogger.info(colorize('[BOLD+RED+BG_GREEN] Test bold red on green', Ansi.bold + Ansi.red + Ansi.bgGreen));
    });
  });
}
