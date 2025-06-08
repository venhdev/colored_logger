import 'package:colored_logger/colored_logger.dart';
import 'package:colored_logger/src/debug.dart';
import 'package:test/test.dart';

// Mock isSupportAnsi for testing non-ANSI environments
bool _mockIsSupportAnsi = true;
bool get isSupportAnsi => _mockIsSupportAnsi;

void main() {
  test('ansiInfo', () {
    showAnsiInfo();
  });
  // group('Ansi and AnsiString Tests', () {
  //   setUp(() {
  //     _mockIsSupportAnsi = true; // Default to ANSI support
  //   });

  //   test('Basic text formatting', () {
  //     expect('Hello'.bold.toString(), equals('\x1B[1mHello\x1B[22m'));
  //     expect('Hello'.italic.toString(), equals('\x1B[3mHello\x1B[23m'));
  //     expect('Hello'.underline.toString(), equals('\x1B[4mHello\x1B[24m'));
  //     expect(
  //         'Hello'.doubleUnderline.toString(), equals('\x1B[21mHello\x1B[24m'));
  //     expect('Hello'.superscript.toString(), equals('\x1B[73mHello\x1B[75m'));
  //     expect('Hello'.subscript.toString(), equals('\x1B[74mHello\x1B[75m'));
  //     expect('Hello'.overline.toString(), equals('\x1B[53mHello\x1B[55m'));
  //     expect('Hello'.framed.toString(), equals('\x1B[51mHello\x1B[54m'));
  //     expect('Hello'.encircled.toString(), equals('\x1B[52mHello\x1B[54m'));
  //     expect('Hello'.slowBlink.toString(), equals('\x1B[5mHello\x1B[25m'));
  //     expect('Hello'.fastBlink.toString(), equals('\x1B[6mHello\x1B[25m'));
  //     expect('Hello'.inverse.toString(), equals('\x1B[7mHello\x1B[27m'));
  //     expect('Hello'.conceal.toString(), equals('\x1B[8mHello\x1B[28m'));
  //     expect('Hello'.strikethrough.toString(), equals('\x1B[9mHello\x1B[29m'));
  //     expect('Hello'.defaultFont.toString(), equals('\x1B[10mHello\x1B[0m'));
  //   });

  //   test('Alternate fonts', () {
  //     expect('Hello'.font(1).toString(), equals('\x1B[11mHello\x1B[10m'));
  //     expect('Hello'.font(9).toString(), equals('\x1B[19mHello\x1B[10m'));
  //     expect(() => 'Hello'.font(0), throwsArgumentError);
  //     expect(() => 'Hello'.font(10), throwsArgumentError);
  //   });

  //   test('Foreground colors (16-color)', () {
  //     expect('Hello'.red.toString(), equals('\x1B[31mHello\x1B[39m'));
  //     expect('Hello'.brightGreen.toString(), equals('\x1B[92mHello\x1B[39m'));
  //     expect('Hello'.cyan.toString(), equals('\x1B[36mHello\x1B[39m'));
  //     expect('Hello'.brightWhite.toString(), equals('\x1B[97mHello\x1B[39m'));
  //   });

  //   test('Background colors (16-color)', () {
  //     expect('Hello'.bgBlue.toString(), equals('\x1B[44mHello\x1B[49m'));
  //     expect(
  //         'Hello'.bgBrightYellow.toString(), equals('\x1B[103mHello\x1B[49m'));
  //     expect('Hello'.bgMagenta.toString(), equals('\x1B[45mHello\x1B[49m'));
  //     expect(
  //         'Hello'.bgBrightBlack.toString(), equals('\x1B[100mHello\x1B[49m'));
  //   });

  //   test('256-color support', () {
  //     expect(
  //         'Hello'.fg256(208).toString(), equals('\x1B[38;5;208mHello\x1B[39m'));
  //     expect(
  //         'Hello'.bg256(128).toString(), equals('\x1B[48;5;128mHello\x1B[49m'));
  //     expect(() => 'Hello'.fg256(-1), throwsArgumentError);
  //     expect(() => 'Hello'.bg256(256), throwsArgumentError);
  //   });

  //   test('True color (RGB) support', () {
  //     expect('Hello'.fgRgb(255, 165, 0).toString(),
  //         equals('\x1B[38;2;255;165;0mHello\x1B[39m'));
  //     expect('Hello'.bgRgb(0, 128, 255).toString(),
  //         equals('\x1B[48;2;0;128;255mHello\x1B[49m'));
  //     expect(() => 'Hello'.fgRgb(256, 0, 0), throwsArgumentError);
  //     expect(() => 'Hello'.bgRgb(0, -1, 0), throwsArgumentError);
  //   });

  //   test('Chaining multiple styles', () {
  //     expect(
  //       'Hello'.bold.green.bgRgb(0, 0, 0).toString(),
  //       equals('\x1B[1;32;48;2;0;0;0mHello\x1B[22;39;49m'),
  //     );
  //     expect(
  //       'Hello'.italic.fg256(208).bgBrightYellow.superscript.toString(),
  //       equals('\x1B[3;38;5;208;103;73mHello\x1B[23;39;49;75m'),
  //     );
  //     expect(
  //       'Hello'.underline.brightCyan.bgBlack.font(2).toString(),
  //       equals('\x1B[4;96;40;12mHello\x1B[24;39;49;10m'),
  //     );
  //   });

  //   test('Nested styles', () {
  //     String nested = Ansi.bold.paint('Bold') + ' and ' + Ansi.red.paint('Red');
  //     expect(
  //       nested.italic.toString(),
  //       equals('\x1B[3m\x1B[1mBold\x1B[22m and \x1B[31mRed\x1B[39m\x1B[23m'),
  //     );

  //     String complexNested =
  //         Ansi.green.paint('Green ' + Ansi.underline.paint('Underlined'));
  //     expect(
  //       complexNested.bold.toString(),
  //       equals(
  //           '\x1B[1m\x1B[32mGreen \x1B[4mUnderlined\x1B[24m\x1B[39m\x1B[22m'),
  //     );
  //   });

  //   test('Complex chaining with nested styles', () {
  //     String nested = Ansi.red.paint('Red ' + Ansi.italic.paint('Italic'));
  //     String rs = nested.bold.bg256(128).toString();
  //     String expectGenToPrint = genEscCodes(rs, toCompare: false);
  //     String expectGenToCompare = genEscCodes(rs, toCompare: true);
  //     print(rs);
  //     print(expectGenToPrint);
  //     expect(
  //       nested.bold.bg256(128).toString(),
  //       equals(expectGenToCompare),
  //       // equals(
  //       //     '\x1B[1;48;5;128m\x1B[31mRed \x1B[3mItalic\x1B[39;1;48;5;128m\x1B[23m\x1B[22;49m'),
  //     );

  //     // String multiNested = Ansi.bold.paint('Bold') +
  //     //     Ansi.cyan.paint(Ansi.underline.paint('Under'));
  //     // expect(
  //     //   multiNested.fg256(208).overline.toString(),
  //     //   equals(
  //     //       '\x1B[38;5;208;53m\x1B[1mBold\x1B[22;38;5;208;53m\x1B[36m\x1B[4mUnder\x1B[24;38;5;208;53m\x1B[39m\x1B[55m'),
  //     // );
  //   });

  //   test('Non-ANSI environment', () {
  //     _mockIsSupportAnsi = false;
  //     expect('Hello'.bold.green.bgRgb(0, 0, 0).toString(), equals('Hello'));
  //     expect('Hello'.fg256(208).italic.toString(), equals('Hello'));
  //     _mockIsSupportAnsi = true; // Reset for other tests
  //   });

  //   test('Edge cases', () {
  //     // Empty string
  //     expect(''.bold.toString(), equals('\x1B[1m\x1B[22m'));
  //     expect(''.fgRgb(255, 0, 0).bg256(128).toString(),
  //         equals('\x1B[38;2;255;0;0;48;5;128m\x1B[39;49m'));

  //     // Null input in paint
  //     expect(Ansi.bold.paint(null), equals('\x1B[1m\x1B[22m'));

  //     // String with existing ANSI codes
  //     String alreadyStyled = '\x1B[31mRed\x1B[39m';
  //     expect(
  //       alreadyStyled.bold.toString(),
  //       equals('\x1B[1m\x1B[31mRed\x1B[39;1m\x1B[22m'),
  //     );

  //     // Chaining with reset
  //     // expect('Hello'.reset.toString(), equals('\x1B[0mHello\x1B[0m'));
  //   });

  //   test('Combining conflicting styles', () {
  //     // Multiple foreground colors (last one wins in most terminals)
  //     expect(
  //       'Hello'.red.brightGreen.fg256(208).toString(),
  //       equals('\x1B[31;92;38;5;208mHello\x1B[39m'),
  //     );

  //     // Multiple background colors
  //     expect(
  //       'Hello'.bgBlue.bgBrightYellow.bgRgb(0, 0, 0).toString(),
  //       equals('\x1B[44;103;48;2;0;0;0mHello\x1B[49m'),
  //     );
  //   });

  //   test('Stringify with non-string inputs', () {
  //     expect(Ansi.bold.paint(123), equals('\x1B[1m123\x1B[22m'));
  //     expect(Ansi.green.paint({'key': 'value'}),
  //         equals('\x1B[32m{"key":"value"}\x1B[39m'));
  //     expect(Ansi.italic.paint([1, 2, 3]), equals('\x1B[3m[1,2,3]\x1B[23m'));
  //     expect(
  //         Ansi.bold.paint(() => 'Dynamic'), equals('\x1B[1mDynamic\x1B[22m'));
  //   });
  // });
}
