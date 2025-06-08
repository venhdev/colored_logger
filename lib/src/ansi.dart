import 'utils.dart';

const int _kResetFg = 39; // Reset foreground color
const int _kResetBg = 49; // Reset background color
const String _esc = '\x1B';

class Ansi {
  // Store all ANSI codes (e.g., ['1', '32', '48;2;0;0;0'])
  final List<String> _codes;
  // Store reset codes (e.g., ['22', '39'])
  final List<String> _resetCodes;

  Ansi._(this._codes, this._resetCodes);

  // Factory for standard codes
  factory Ansi(int enable, int disable) {
    return Ansi._([enable.toString()], [disable.toString()]);
  }

  // Combine with another Ansi instance
  Ansi combine(Ansi other) {
    // Merge codes and reset codes, avoiding duplicates
    final codes = [..._codes, ...other._codes];
    final resetCodes = [..._resetCodes, ...other._resetCodes];
    return Ansi._(codes, resetCodes);
  }

  // Combine with another Ansi instance
  Ansi operator +(Ansi other) {
    // Merge codes and reset codes, avoiding duplicates
    final codes = [..._codes, ...other._codes];
    final resetCodes = [..._resetCodes, ...other._resetCodes];
    return Ansi._(codes, resetCodes);
  }

  String get on => '$_esc[${_codes.join(';')}m';
  String get off => '$_esc[${_resetCodes.join(';')}m';

  /// - [input] - input data, it can be any type
  String paint(dynamic input) {
    String str = stringify(input);

    // Handle nested styles by reapplying 'on' after each 'off'
    if (str.contains(_esc)) {
      str = stringAppendAfterSubstring(
        src: str,
        pattern: off,
        suffix: on,
      );
    }

    return '$on$str$off';
  }

  // STATIC METHODS (Original API preserved)
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
  static Ansi get superscript => Ansi(73, 75);
  static Ansi get subscript => Ansi(74, 75);
  static Ansi get overline => Ansi(53, 55);
  static Ansi get framed => Ansi(51, 54);
  static Ansi get encircled => Ansi(52, 54);

  // ## 2. Alternate Fonts
  static Ansi font(int n) {
    if (n < 1 || n > 9) {
      throw ArgumentError('Font number must be between 1 and 9');
    }
    return Ansi(10 + n, 10);
  }

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

  // Factory for 256-color foreground
  static Ansi fg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return Ansi._(['38;5;$colorIndex'], [_kResetFg.toString()]);
  }

  // Factory for 256-color background
  static Ansi bg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return Ansi._(['48;5;$colorIndex'], [_kResetBg.toString()]);
  }

  // Factory for true color (RGB) foreground
  static Ansi fgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return Ansi._(['38;2;$r;$g;$b'], [_kResetFg.toString()]);
  }

  // Factory for true color (RGB) background
  static Ansi bgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return Ansi._(['48;2;$r;$g;$b'], [_kResetBg.toString()]);
  }

  // Create an empty Ansi instance to start chaining
  static Ansi get empty => Ansi._([], []);

  // FLUENT CHAINING METHODS (with 'c' prefix for combining)
  // These return new Ansi instances combined with the current one

  // ## 1. Text Formatting (Fluent)
  Ansi get cReset => combine(Ansi(0, 0));
  Ansi get cBold => combine(Ansi(1, 22));
  Ansi get cFaint => combine(Ansi(2, 22));
  Ansi get cItalic => combine(Ansi(3, 23));
  Ansi get cUnderline => combine(Ansi(4, 24));
  Ansi get cSlowBlink => combine(Ansi(5, 25));
  Ansi get cFastBlink => combine(Ansi(6, 25));
  Ansi get cInverse => combine(Ansi(7, 27));
  Ansi get cConceal => combine(Ansi(8, 28));
  Ansi get cStrikethrough => combine(Ansi(9, 29));
  Ansi get cDefaultFont => combine(Ansi(10, 0));
  Ansi get cDoubleUnderline => combine(Ansi(21, 24));
  Ansi get cSuperscript => combine(Ansi(73, 75));
  Ansi get cSubscript => combine(Ansi(74, 75));
  Ansi get cOverline => combine(Ansi(53, 55));
  Ansi get cFramed => combine(Ansi(51, 54));
  Ansi get cEncircled => combine(Ansi(52, 54));

  // ## 2. Alternate Fonts (Fluent)
  Ansi cFont(int n) {
    if (n < 1 || n > 9) {
      throw ArgumentError('Font number must be between 1 and 9');
    }
    return combine(Ansi(10 + n, 10));
  }

  // ## 3. Foreground Colors (Fluent)
  Ansi get cBlack => combine(Ansi(30, _kResetFg));
  Ansi get cRed => combine(Ansi(31, _kResetFg));
  Ansi get cGreen => combine(Ansi(32, _kResetFg));
  Ansi get cYellow => combine(Ansi(33, _kResetFg));
  Ansi get cBlue => combine(Ansi(34, _kResetFg));
  Ansi get cMagenta => combine(Ansi(35, _kResetFg));
  Ansi get cCyan => combine(Ansi(36, _kResetFg));
  Ansi get cWhite => combine(Ansi(37, _kResetFg));
  Ansi get cBrightBlack => combine(Ansi(90, _kResetFg));
  Ansi get cBrightRed => combine(Ansi(91, _kResetFg));
  Ansi get cBrightGreen => combine(Ansi(92, _kResetFg));
  Ansi get cBrightYellow => combine(Ansi(93, _kResetFg));
  Ansi get cBrightBlue => combine(Ansi(94, _kResetFg));
  Ansi get cBrightMagenta => combine(Ansi(95, _kResetFg));
  Ansi get cBrightCyan => combine(Ansi(96, _kResetFg));
  Ansi get cBrightWhite => combine(Ansi(97, _kResetFg));

  // ## 4. Background Colors (Fluent)
  Ansi get cBgBlack => combine(Ansi(40, _kResetBg));
  Ansi get cBgRed => combine(Ansi(41, _kResetBg));
  Ansi get cBgGreen => combine(Ansi(42, _kResetBg));
  Ansi get cBgYellow => combine(Ansi(43, _kResetBg));
  Ansi get cBgBlue => combine(Ansi(44, _kResetBg));
  Ansi get cBgMagenta => combine(Ansi(45, _kResetBg));
  Ansi get cBgCyan => combine(Ansi(46, _kResetBg));
  Ansi get cBgWhite => combine(Ansi(47, _kResetBg));
  Ansi get cBgBrightBlack => combine(Ansi(100, _kResetBg));
  Ansi get cBgBrightRed => combine(Ansi(101, _kResetBg));
  Ansi get cBgBrightGreen => combine(Ansi(102, _kResetBg));
  Ansi get cBgBrightYellow => combine(Ansi(103, _kResetBg));
  Ansi get cBgBrightBlue => combine(Ansi(104, _kResetBg));
  Ansi get cBgBrightMagenta => combine(Ansi(105, _kResetBg));
  Ansi get cBgBrightCyan => combine(Ansi(106, _kResetBg));
  Ansi get cBgBrightWhite => combine(Ansi(107, _kResetBg));

  // ## 5. Extended color methods (Fluent)
  Ansi cFg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return combine(Ansi._(['38;5;$colorIndex'], [_kResetFg.toString()]));
  }

  Ansi cBg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return combine(Ansi._(['48;5;$colorIndex'], [_kResetBg.toString()]));
  }

  Ansi cFgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return combine(Ansi._(['38;2;$r;$g;$b'], [_kResetFg.toString()]));
  }

  Ansi cBgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return combine(Ansi._(['48;2;$r;$g;$b'], [_kResetBg.toString()]));
  }
}
