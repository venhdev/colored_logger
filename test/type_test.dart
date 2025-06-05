import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('type test', () {
    final type = stdioType(stdout);
    final ansi = stdout.supportsAnsiEscapes;
    print('supportsAnsiEscapes: $ansi');
    print('type: $type');
  });
}
