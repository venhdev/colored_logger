import 'package:colored_logger/ansi_code.dart';
import 'package:colored_logger/colored_logger.dart';
import 'package:flutter_test/flutter_test.dart';

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
  });

  group('Custom Logging with Color Codes', () {
    test('normal color code', () {
      ColoredLogger.custom('Test normal message',
          colorCode: 'normal', prefix: '[NORMAL] ');
    });

    test('custom color codes', () {
      ColoredLogger.custom('Test blue message',
          colorCode: 'blue', prefix: '[BLUE] ');
      ColoredLogger.custom('Test red message',
          colorCode: 'red', prefix: '[RED] ');
      ColoredLogger.custom('Test green message',
          colorCode: 'green', prefix: '[GREEN] ');
      ColoredLogger.custom('Test yellow message',
          colorCode: 'yellow', prefix: '[YELLOW] ');
    });
  });

  group('Custom Logging with ANSI Codes', () {
    test('single ANSI code', () {
      ColoredLogger.custom('Test bold text',
          ansiCode: [AnsiCode.bold], prefix: '[BOLD] ');
      ColoredLogger.custom('Test dim text',
          ansiCode: [AnsiCode.dim], prefix: '[DIM] ');
      ColoredLogger.custom('Test underline text',
          ansiCode: [AnsiCode.underline], prefix: '[UNDERLINE] ');
    });

    test('background colors', () {
      ColoredLogger.custom('Test bg red',
          ansiCode: [AnsiCode.bgRed], prefix: '[BG_RED] ');
      ColoredLogger.custom('Test bg blue',
          ansiCode: [AnsiCode.bgBlue], prefix: '[BG_BLUE] ');
      ColoredLogger.custom('Test bg green',
          ansiCode: [AnsiCode.bgGreen], prefix: '[BG_GREEN] ');
    });

    test('combined ANSI codes', () {
      ColoredLogger.custom(
        'Test combined styles',
        ansiCode: [
          AnsiCode.bold,
          AnsiCode.underline,
          AnsiCode.red,
          AnsiCode.bgYellow,
        ],
        prefix: '[COMBINED] ',
      );

      ColoredLogger.custom(
        'Test bright colors',
        ansiCode: [
          AnsiCode.brightBlue,
          AnsiCode.bgBrightGreen,
        ],
        prefix: '[BRIGHT] ',
      );
    });
  });
}
