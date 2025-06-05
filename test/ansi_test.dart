import 'dart:io';

import 'package:colored_logger/colored_logger.dart';
import 'package:colored_logger/src/extensions.dart';
import 'package:colored_logger/src/utils.dart';
import 'package:test/test.dart';

void main() {
  test('fg256, fgb', () {
    print('Hello'.bold.green); // Bold text
    print('Hello'.fg256(208)); // 256-color orange text
    print('Hello'.fgRgb(255, 165, 0)); // True color orange text
    print('Hello'.doubleUnderline); // Double underlined text
    print('Hello'.font(9)); // Alternate font 1
  });
  test('test', () {
    // final str = 'Hello World'.strikethrough.italic.bold.yellow.red.blue.green;
    // print("\x1B[1;32mĐây là văn bản in đậm màu xanh lá cây.\x1B[0m");
    // print("Đây là văn bản in đậm màu xanh lá cây".bold.green);
    // print("Đây là văn bản in đậm màu xanh lá cây".bold.blue.green.italic);
    // print(
    //     'normal with ${'green'.green} and ${'red'.red} and ${'blue with bold bgBrightGreen'.bgBrightGreen}'.yellow);

    // print(bold('this is all red ${'text'.red()} with little ${'yellow'.yellow()} and ${green('green')}').red());

    print(isSupportAnsi.toString());

    final rs =
        '\rth\nis is\n\t\t\r\r all ${'re\nd'.red} text\n with little\n ${'yellow'.yellow} and ${'green'.green}'
            .red;
    print(rs);

    // print("\x1B[31;4mĐây là văn bản màu đỏ và gạch chân.\x1B[0m");

    // print("\x1B[43;34mĐây là văn bản chữ xanh dương trên nền vàng.\x1B[0m");
    // print(str);
  });

  test('supports Ansi Escapes', () {
    final isSupportAnsi = _supportAnsi;
    final type = stdioType(stdout);

    final coloredText =
        colorizeText('Hello World', ansiCodes: AnsiColors.alert);

    print(coloredText); // Output: Hello World
    print('stdout.supportsAnsiEscapes: ${stdout.supportsAnsiEscapes}');
    print('isSupportAnsi: $isSupportAnsi');
    print('type: $type');

    // # In đậm và màu xanh lá cây
    print("\x1B[1;32mĐây là văn bản in đậm màu xanh lá cây.\x1B[0m");
    print(
        '2 Đây\n\t là văn bản in\n\r đậm màu xanh ${'đỏ'.strikethrough} lá cây.'
            .bold
            .green);
    print('3 Đây là văn \n\rbản in đậm màu xanh lá cây.'.green.bold);

    // # Màu đỏ và gạch chân
    print("\x1B[31;4mĐây là văn bản màu đỏ và gạch chân.\x1B[0m");

    // # Nền vàng, chữ xanh dương
    print("\x1B[43;34mĐây là văn bản chữ xanh dương trên nền vàng.\x1B[0m");
    // check rs is boolean
    expect(isSupportAnsi, isA<bool>());
  });
}

bool get _supportAnsi =>
    stdout.supportsAnsiEscapes && stdioType(stdout) == StdioType.terminal;
