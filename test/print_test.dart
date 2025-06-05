import 'package:colored_logger/src/ansi.dart';
import 'package:colored_logger/src/extensions.dart';
import 'package:test/test.dart';

// Mock isSupportAnsi for testing non-ANSI environments
bool _mockIsSupportAnsi = true;
bool get isSupportAnsi => _mockIsSupportAnsi;

void main() {
  test('test name', () {
    print('=== Basic Text Formatting ===');
    print('Bold: ${'Hello'.bold}');
    print('Italic: ${'Hello'.italic}');
    print('Underline: ${'Hello'.underline}');
    print('Double Underline: ${'Hello'.doubleUnderline}');
    print('Superscript: ${'Hello'.superscript}');
    print('Subscript: ${'Hello'.subscript}');
    print('Overline: ${'Hello'.overline}');
    print('Framed: ${'Hello'.framed}');
    print('Encircled: ${'Hello'.encircled}');
    print('Slow Blink: ${'Hello'.slowBlink}');
    print('Fast Blink: ${'Hello'.fastBlink}');
    print('Inverse: ${'Hello'.inverse}');
    print('Conceal: ${'Hello'.conceal}');
    print('Strikethrough: ${'Hello'.strikethrough}');
    print('Default Font: ${'Hello'.defaultFont}');

    print('\n=== Alternate Fonts ===');
    print('Font 1: ${'Hello'.font(1)}');
    print('Font 9: ${'Hello'.font(9)}');
    try {
      print('Font 0 (should throw): ${'Hello'.font(0)}');
    } catch (e) {
      print('Font 0 error: $e');
    }
    try {
      print('Font 10 (should throw): ${'Hello'.font(10)}');
    } catch (e) {
      print('Font 10 error: $e');
    }

    print('\n=== Foreground Colors (16-color) ===');
    print('Red: ${'Hello'.red}');
    print('Bright Green: ${'Hello'.brightGreen}');
    print('Cyan: ${'Hello'.cyan}');
    print('Bright White: ${'Hello'.brightWhite}');

    print('\n=== Background Colors (16-color) ===');
    print('Blue Background: ${'Hello'.bgBlue}');
    print('Bright Yellow Background: ${'Hello'.bgBrightYellow}');
    print('Magenta Background: ${'Hello'.bgMagenta}');
    print('Bright Black Background: ${'Hello'.bgBrightBlack}');

    print('\n=== 256-Color Support ===');
    print('Foreground 256 (208): ${'Hello'.fg256(208)}');
    print('Background 256 (128): ${'Hello'.bg256(128)}');
    try {
      print('Foreground 256 (-1, should throw): ${'Hello'.fg256(-1)}');
    } catch (e) {
      printrule:
      print('Foreground 256 (-1) error: $e');
    }
    try {
      print('Background 256 (256, should throw): ${'Hello'.bg256(256)}');
    } catch (e) {
      print('Background 256 (256) error: $e');
    }

    print('\n=== True Color (RGB) Support ===');
    print('Foreground RGB(255,165,0): ${'Hello'.fgRgb(255, 165, 0)}');
    print('Background RGB(0,128,255): ${'Hello'.bgRgb(0, 128, 255)}');
    try {
      print(
          'Foreground RGB(256,0,0, should throw): ${'Hello'.fgRgb(256, 0, 0)}');
    } catch (e) {
      print('Foreground RGB(256,0,0) error: $e');
    }

    print('\n=== Chaining Multiple Styles ===');
    print(
        'Bold + Green + Black RGB Background: ${'Hello'.bold.green.bgRgb(0, 0, 0)}');
    print(
        'Italic + 256(208) + Bright Yellow Background + Superscript: ${'Hello'.italic.fg256(208).bgBrightYellow.superscript}');
    print(
        'Underline + Bright Cyan + Black Background + Font 2: ${'Hello'.underline.brightCyan.bgBlack.font(2)}');

    print('\n=== Nested Styles ===');
    String nested = Ansi.bold.paint('Bold') + ' and ' + Ansi.red.paint('Red');
    print('Bold + Red, then Italic: $nested.italic');
    String complexNested =
        Ansi.green.paint('Green ' + Ansi.underline.paint('Underlined'));
    print('Green + Underlined, then Bold: $complexNested.bold');

    print('\n=== Complex Chaining with Nested Styles with long text===');
    String nested1 = Ansi.bold.paint('Bold') +
        Ansi.red.paint('Red' + Ansi.italic.paint('Italic'));
    print(
        'Bold + Red + Italic, then Underline + 256(208): ${nested1.underline.bg256(208)}');
    String multiNested1 = Ansi.bold.paint('Bold') +
        Ansi.cyan.paint(Ansi.underline.paint('Under'));
    print(
        'Bold + (Cyan + Under), then 256(208) + Overline: ${multiNested1.fg256(208).overline}');
    print('\n=== Complex Chaining with Nested Styles ===');
    String nested2 = Ansi.red.paint('Red ' + Ansi.italic.paint('Italic'));
    print('Red + Italic, then Bold + 256(128): $nested2.bold.bg256(128)}');
    String multiNested = Ansi.bold.paint('Bold') +
        Ansi.cyan.paint(Ansi.underline.paint('Under'));
    print(
        'Bold + (Cyan + Under), then 256(208) + Overline: $multiNested.fg256(208).overline');

    print('\n=== Non-ANSI Environment ===');
    _mockIsSupportAnsi = false;
    print(
        'Bold + Green + RGB Background (no ANSI): ${'Hello'.bold.green.bgRgb(0, 0, 0)}');
    print('256(208) + Italic (no ANSI): ${'Hello'.fg256(208).italic}');
    _mockIsSupportAnsi = true; // Reset

    print('\n=== Edge Cases ===');
    print('Empty string: ${''.bold}');
    print(
        'Empty string with multiple styles: ${''.fgRgb(255, 0, 0).bg256(128)}');
    print('Null input: ${Ansi.bold.paint(null)}');
    String alreadyStyled = '\x1B[31mRed\x1B[39m';
    print('Already styled + Bold: $alreadyStyled.bold');
    // print('Reset: ${'Hello'.reset}');

    print('\n=== Combining Conflicting Styles ===');
    print(
        'Multiple foregrounds (Red + Bright Green + 256(208)): ${'Hello'.red.brightGreen.fg256(208)}');
    print(
        'Multiple backgrounds (Blue + Bright Yellow + RGB(0,0,0)): ${'Hello'.bgBlue.bgBrightYellow.bgRgb(0, 0, 0)}');

    print('\n=== Stringify with Non-String Inputs ===');
    print('Number: ${Ansi.bold.paint(123)}');
    print('Map: ${Ansi.green.paint({'key': 'value'})}');
    print('List: ${Ansi.italic.paint([1, 2, 3])}');
    print('Function: ${Ansi.bold.paint(() => 'Dynamic')}');
    print('double: ${Ansi.bold.paint(123.112)}');

    print('\n=== Very complex text styling ===');
    final s1 = 'This normal ${'red'.red} very ${'bold'.bold} and complex';
    print(
      s1.slowBlink.yellow.bold.toString() +
          'normal' +
          'italic'.italic.toString() +
          'BOLD${'red${'blink'.fastBlink}'.red}'.bold.toString(),
    );
  });

  test('test 2', () {
    print('=== Basic Text Formatting ===');
    print('Bold: ${bold('Hello')}');
    print('Italic: ${italic('Hello')}');
    print('Underline: ${underline('Hello')}');
    print('Double Underline: ${doubleUnderline('Hello')}');
    print('Superscript: ${superscript('Hello')}');
    print('Subscript: ${subscript('Hello')}');
    print('Overline: ${overline('Hello')}');
    print('Framed: ${framed('Hello')}');
    print('Encircled: ${encircled('Hello')}');
    print('Slow Blink: ${slowBlink('Hello')}');
    print('Fast Blink: ${fastBlink('Hello')}');
    print('Inverse: ${inverse('Hello')}');
    print('Conceal: ${conceal('Hello')}');
    print('Strikethrough: ${strikethrough('Hello')}');
    print('Default Font: ${defaultFont('Hello')}');

    print('\n=== Alternate Fonts ===');
    print('Font 1: ${font('Hello', 1)}');
    print('Font 9: ${font('Hello', 9)}');
    try {
      print('Font 0 (should throw): ${font('Hello', 0)}');
    } catch (e) {
      print('Font 0 error: $e');
    }
    try {
      print('Font 10 (should throw): ${font('Hello', 10)}');
    } catch (e) {
      print('Font 10 error: $e');
    }

    print('\n=== Foreground Colors (16-color) ===');
    print('Red: ${red('Hello')}');
    print('Bright Green: ${brightGreen('Hello')}');
    print('Cyan: ${cyan('Hello')}');
    print('Bright White: ${brightWhite('Hello')}');

    print('\n=== Background Colors (16-color) ===');
    print('Blue Background: ${bgBlue('Hello')}');
    print('Bright Yellow Background: ${bgBrightYellow('Hello')}');
    print('Magenta Background: ${bgMagenta('Hello')}');
    print('Bright Black Background: ${bgBrightBlack('Hello')}');

    print('\n=== 256-Color Support ===');
    print('Foreground 256 (208): ${fg256('Hello', 208)}');
    print('Background 256 (128): ${bg256('Hello', 128)}');
    try {
      print('Foreground 256 (-1, should throw): ${fg256('Hello', -1)}');
    } catch (e) {
      print('Foreground 256 (-1) error: $e');
    }
    try {
      print('Background 256 (256, should throw): ${bg256('Hello', 256)}');
    } catch (e) {
      print('Background 256 (256) error: $e');
    }

    print('\n=== True Color (RGB) Support ===');
    print('Foreground RGB(255,165,0): ${fgRgb('Hello', 255, 165, 0)}');
    print('Background RGB(0,128,255): ${bgRgb('Hello', 0, 128, 255)}');
    try {
      print(
          'Foreground RGB(256,0,0, should throw): ${fgRgb('Hello', 256, 0, 0)}');
    } catch (e) {
      print('Foreground RGB(256,0,0) error: $e');
    }

    print('\n=== Chaining Multiple Styles ===');
    print(
        'Bold + Green + Black RGB Background: ${bold('Hello').green.bgRgb(0, 0, 0)}');
    print(
        'Italic + 256(208) + Bright Yellow Background + Superscript: ${italic('Hello').fg256(208).bgBrightYellow.superscript}');
    print(
        'Underline + Bright Cyan + Black Background + Font 2: ${underline('Hello').brightCyan.bgBlack.font(2)}');

    print('\n=== Nested Styles ===');
    String nested = bold('Bold').toString() + ' and ' + red('Red').toString();
    print('Bold + Red, then Italic: ${italic(nested)}');
    String complexNested =
        green('Green ' + underline('Underlined').toString()).toString();
    print('Green + Underlined, then Bold: ${bold(complexNested)}');

    print('\n=== Complex Chaining with Nested Styles ===');
    String nested2 = red('Red ' + italic('Italic').toString()).toString();
    print('Red + Italic, then Bold + 256(128): ${bold(nested2).bg256(128)}');
    String multiNested = bold('Bold').toString() +
        cyan(underline('Under').toString()).toString();
    print(
        'Bold + (Cyan + Under), then 256(208) + Overline: ${fg256(multiNested, 208).overline}');

    print('\n=== Non-ANSI Environment ===');
    _mockIsSupportAnsi = false;
    print(
        'Bold + Green + RGB Background (no ANSI): ${bold('Hello').green.bgRgb(0, 0, 0)}');
    print('256(208) + Italic (no ANSI): ${fg256('Hello', 208).italic}');
    _mockIsSupportAnsi = true; // Reset

    print('\n=== Edge Cases ===');
    print('Empty string: ${bold('')}');
    print(
        'Empty string with multiple styles: ${fgRgb('', 255, 0, 0).bg256(128)}');
    print('Null input: ${Ansi.bold.paint(null)}');
    String alreadyStyled = '\x1B[31mRed\x1B[39m';
    print('Already styled + Bold: ${bold(alreadyStyled)}');
    print('Reset: ${StyledString('Hello', [Ansi.reset])}');

    print('\n=== Combining Conflicting Styles ===');
    print(
        'Multiple foregrounds (Red + Bright Green + 256(208)): ${red('Hello').brightGreen.fg256(208)}');
    print(
        'Multiple backgrounds (Blue + Bright Yellow + RGB(0,0,0)): ${bgBlue('Hello').bgBrightYellow.bgRgb(0, 0, 0)}');

    print('\n=== Stringify with Non-String Inputs ===');
    print('Number: ${bold('123')}');
    print('Map: ${green('{"key":"value"}')}');
    print('List: ${italic('[1,2,3]')}');
    print('Function: ${bold('Dynamic')}');
  });
}
