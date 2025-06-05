import 'ansi.dart';

extension AnsiString on String {
  // ## 1. Text Formatting
  String get bold => Ansi.bold.paint(this);
  String get faint => Ansi.faint.paint(this);
  String get italic => Ansi.italic.paint(this);
  String get underline => Ansi.underline.paint(this);
  String get slowBlink => Ansi.slowBlink.paint(this);
  String get fastBlink => Ansi.fastBlink.paint(this);
  String get inverse => Ansi.inverse.paint(this);
  String get conceal => Ansi.conceal.paint(this);
  String get strikethrough => Ansi.strikethrough.paint(this);
  String get defaultFont => Ansi.defaultFont.paint(this);
  String get doubleUnderline => Ansi.doubleUnderline.paint(this);

  // ## 2. Alternate Fonts
  String font(int n) => Ansi.font(n).paint(this);

  // ## 3. Foreground Colors
  String get black => Ansi.black.paint(this);
  String get red => Ansi.red.paint(this);
  String get green => Ansi.green.paint(this);
  String get yellow => Ansi.yellow.paint(this);
  String get blue => Ansi.blue.paint(this);
  String get magenta => Ansi.magenta.paint(this);
  String get cyan => Ansi.cyan.paint(this);
  String get white => Ansi.white.paint(this);
  String get brightBlack => Ansi.brightBlack.paint(this);
  String get brightRed => Ansi.brightRed.paint(this);
  String get brightGreen => Ansi.brightGreen.paint(this);
  String get brightYellow => Ansi.brightYellow.paint(this);
  String get brightBlue => Ansi.brightBlue.paint(this);
  String get brightMagenta => Ansi.brightMagenta.paint(this);
  String get brightCyan => Ansi.brightCyan.paint(this);
  String get brightWhite => Ansi.brightWhite.paint(this);

  // ## 4. Background Colors
  String get bgBlack => Ansi.bgBlack.paint(this);
  String get bgRed => Ansi.bgRed.paint(this);
  String get bgGreen => Ansi.bgGreen.paint(this);
  String get bgYellow => Ansi.bgYellow.paint(this);
  String get bgBlue => Ansi.bgBlue.paint(this);
  String get bgMagenta => Ansi.bgMagenta.paint(this);
  String get bgCyan => Ansi.bgCyan.paint(this);
  String get bgWhite => Ansi.bgWhite.paint(this);
  String get bgBrightBlack => Ansi.bgBrightBlack.paint(this);
  String get bgBrightRed => Ansi.bgBrightRed.paint(this);
  String get bgBrightGreen => Ansi.bgBrightGreen.paint(this);
  String get bgBrightYellow => Ansi.bgBrightYellow.paint(this);
  String get bgBrightBlue => Ansi.bgBrightBlue.paint(this);
  String get bgBrightMagenta => Ansi.bgBrightMagenta.paint(this);
  String get bgBrightCyan => Ansi.bgBrightCyan.paint(this);
  String get bgBrightWhite => Ansi.bgBrightWhite.paint(this);

  // ## 5. 256-Color Support
  String fg256(int colorIndex) => Ansi.fg256(colorIndex).paint(this);
  String bg256(int colorIndex) => Ansi.bg256(colorIndex).paint(this);

  // ## 6. True Color (RGB) Support
  String fgRgb(int r, int g, int b) => Ansi.fgRgb(r, g, b).paint(this);
  String bgRgb(int r, int g, int b) => Ansi.bgRgb(r, g, b).paint(this);
}