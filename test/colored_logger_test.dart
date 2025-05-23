import 'package:colored_logger/ansi_code.dart';
import 'package:colored_logger/colored_logger.dart';
import 'package:flutter/foundation.dart';
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

    test('multi lines', () {
      ColoredLogger.custom('Line 1\nLine 2\nLine 3', prefix: '[DEBUG] ', colorCode: 'green');
    });
  });

  group('Custom Logging with Color Codes', () {
    test('normal color code', () {
      ColoredLogger.custom('Test normal message', colorCode: 'normal', prefix: '[NORMAL] ');
    });

    test('custom color codes', () {
      ColoredLogger.custom('Test blue message', colorCode: 'blue', prefix: '[BLUE] ');
      ColoredLogger.custom('Test red message', colorCode: 'red', prefix: '[RED] ');
      ColoredLogger.custom('Test green message', colorCode: 'green', prefix: '[GREEN] ');
      ColoredLogger.custom('Test yellow message', colorCode: 'yellow', prefix: '[YELLOW] ');
    });

    test('long string', () {
      final String longString = 'A' * 100000; // 100,000 'A's
      ColoredLogger.custom(longString, colorCode: 'green', prefix: '[BLUE] ');
    });
  });

  group('Custom Logging with ANSI Codes', () {
    test('single ANSI code', () {
      ColoredLogger.custom('Test bold text', ansiCode: [AnsiCode.bold], prefix: '[BOLD] ');
      ColoredLogger.custom('Test dim text', ansiCode: [AnsiCode.dim], prefix: '[DIM] ');
      ColoredLogger.custom('Test underline text', ansiCode: [AnsiCode.underline], prefix: '[UNDERLINE] ');
    });

    test('background colors', () {
      ColoredLogger.custom('Test bg red', ansiCode: [AnsiCode.bgRed], prefix: '[BG_RED] ');
      ColoredLogger.custom('Test bg blue', ansiCode: [AnsiCode.bgBlue], prefix: '[BG_BLUE] ');
      ColoredLogger.custom('Test bg green', ansiCode: [AnsiCode.bgGreen], prefix: '[BG_GREEN] ');
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

  /// Print Long String

  group('long print', () {
    test('long print', () {
      final String longString = 'A' * 100000; // 10,000 'A's
      print('$longString--print-end');
      debugPrint('$longString--debugPrint-end');
      // printLongString('$longString--printLongString-end');
    });
  });
}
