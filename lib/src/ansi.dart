import 'utils.dart';

const int _kResetFg = 39; // Reset foreground color
const int _kResetBg = 49; // Reset background color
const String _esc = '\x1B';

class Ansi {
  final int enable;
  final int disable;

  Ansi(this.enable, this.disable);

  // Internal storage for extended color parameters
  List<String>? _colorParams;

  // String get on => '$_esc[${enable}m';
  // @override
  String get on => _colorParams != null
      ? '$_esc[$enable;${_colorParams!.join(';')}m'
      : '$_esc[${enable}m';
  String get off => '$_esc[${disable}m';

  String paint(dynamic input) {
    String str = stringify(input);

    if (!isSupportAnsi) return str;
    if (str.contains(_esc)) {
      str = stringAppendAfterSubstring(
        src: str,
        pattern: off,
        suffix: on,
      );
    }

    return '$on$str$off';
  }

  // Factory for 256-color foreground
  static Ansi fg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return Ansi(38, _kResetFg).._colorParams = ['5', colorIndex.toString()];
  }

  // Factory for 256-color background
  static Ansi bg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return Ansi(48, _kResetBg).._colorParams = ['5', colorIndex.toString()];
  }

  // Factory for true color (RGB) foreground
  static Ansi fgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return Ansi(38, _kResetFg)
      .._colorParams = ['2', r.toString(), g.toString(), b.toString()];
  }

  // Factory for true color (RGB) background
  static Ansi bgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return Ansi(48, _kResetBg)
      .._colorParams = ['2', r.toString(), g.toString(), b.toString()];
  }

  // ## 1. Text Formatting
  static Ansi get reset => Ansi(0, 0);
  static Ansi get bold => Ansi(1, 22);
  static Ansi get faint => Ansi(2, 22);
  static Ansi get italic => Ansi(3, 23);
  static Ansi get underline => Ansi(4, 24);
  static Ansi get slowBlink => Ansi(5, 25);
  static Ansi get fastBlink => Ansi(6, 25);
  static Ansi get inverse => Ansi(7, 27);
  static Ansi get conceal => Ansi(8, 28);
  static Ansi get strikethrough => Ansi(9, 29);
  static Ansi get defaultFont => Ansi(10, 0);
  static Ansi get doubleUnderline => Ansi(21, 24);

  // ### Alternate Fonts
  static Ansi font(int n) {
    if (n < 1 || n > 9) {
      throw ArgumentError('Font number must be between 1 and 9');
    }
    return Ansi(10 + n, 10);
  }

  // ## 2. Effect Off Codes
  // These are handled by the disable parameter in the Ansi constructor.

  // ## 3. Foreground Colors
  static Ansi get black => Ansi(30, _kResetFg);
  static Ansi get red => Ansi(31, _kResetFg);
  static Ansi get green => Ansi(32, _kResetFg);
  static Ansi get yellow => Ansi(33, _kResetFg);
  static Ansi get blue => Ansi(34, _kResetFg);
  static Ansi get magenta => Ansi(35, _kResetFg);
  static Ansi get cyan => Ansi(36, _kResetFg);
  static Ansi get white => Ansi(37, _kResetFg);
  static Ansi get brightBlack => Ansi(90, _kResetFg);
  static Ansi get brightRed => Ansi(91, _kResetFg);
  static Ansi get brightGreen => Ansi(92, _kResetFg);
  static Ansi get brightYellow => Ansi(93, _kResetFg);
  static Ansi get brightBlue => Ansi(94, _kResetFg);
  static Ansi get brightMagenta => Ansi(95, _kResetFg);
  static Ansi get brightCyan => Ansi(96, _kResetFg);
  static Ansi get brightWhite => Ansi(97, _kResetFg);

  // ## 4. Background Colors
  static Ansi get bgBlack => Ansi(40, _kResetBg);
  static Ansi get bgRed => Ansi(41, _kResetBg);
  static Ansi get bgGreen => Ansi(42, _kResetBg);
  static Ansi get bgYellow => Ansi(43, _kResetBg);
  static Ansi get bgBlue => Ansi(44, _kResetBg);
  static Ansi get bgMagenta => Ansi(45, _kResetBg);
  static Ansi get bgCyan => Ansi(46, _kResetBg);
  static Ansi get bgWhite => Ansi(47, _kResetBg);
  static Ansi get bgBrightBlack => Ansi(100, _kResetBg);
  static Ansi get bgBrightRed => Ansi(101, _kResetBg);
  static Ansi get bgBrightGreen => Ansi(102, _kResetBg);
  static Ansi get bgBrightYellow => Ansi(103, _kResetBg);
  static Ansi get bgBrightBlue => Ansi(104, _kResetBg);
  static Ansi get bgBrightMagenta => Ansi(105, _kResetBg);
  static Ansi get bgBrightCyan => Ansi(106, _kResetBg);
  static Ansi get bgBrightWhite => Ansi(107, _kResetBg);
}
