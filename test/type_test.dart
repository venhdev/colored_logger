import 'dart:developer';
import 'dart:io';

import 'package:colored_logger/colored_logger.dart';
import 'package:test/test.dart';

void main() {
  test('type test', () {
    final type = stdioType(stdout);
    final ansi = stdout.supportsAnsiEscapes;
    print('supportsAnsiEscapes: $ansi');
    print('type: $type');
  });

  test('--', () {
    final str =
        '''curl -i -X GET -H "Content-Type: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS1kc3AubmV3d2ViLnZuL2NsaWVudC9hdXRoL3Rva2VuLWJ5LXVzZXItY29kZS9LSEFDSExFIiwiaWF0IjoxNzQ4OTczMzMyLCJleHAiOjE3ODA1MDkzMzIsIm5iZiI6MTc0ODk3MzMzMiwianRpIjoiU0JBT1pOMXM4ZFgxd0pobyIsInN1YiI6IjgiLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.ub6h1zzGL3QanxyyAlnN04r4LM2g7tHcMkLNk8VaJB0" "https://api-dsp.newweb.vn/v1/client/get-cart"''';
    log('red ${str.bold.red.toString()}');
    print('green ${str.bold.green.toString()}');
  });
}
