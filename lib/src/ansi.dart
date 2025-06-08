import 'utils.dart';

const int _kResetFg = 39; // Reset foreground color
const int _kResetBg = 49; // Reset background color
const String _esc = '\x1B';

class Ansi {
  /// Stores the ANSI escape codes that enable a specific style or color.
  /// These codes are joined with semicolons and prefixed with `\x1B[` to form the 'on' sequence. (e.g., ['1', '32', '48;2;0;0;0'])
  final List<String> _codes;

  /// Stores the ANSI escape codes that disable or reset a specific style or color.
  /// These codes are joined with semicolons and prefixed with `\x1B[` to form the 'off' sequence. (e.g., ['22', '39'])
  final List<String> _resetCodes;

  /// Private constructor for `Ansi` class.
  ///
  /// Initializes an `Ansi` instance with a list of `_codes` to enable a style
  /// and a list of `_resetCodes` to disable it.
  ///
  /// Parameters:
  /// - `_codes`: A list of strings representing the ANSI codes to apply.
  /// - `_resetCodes`: A list of strings representing the ANSI codes to reset the applied style.
  Ansi._(this._codes, this._resetCodes);

  /// Factory constructor for creating standard `Ansi` instances.
  ///
  /// This constructor is used for simple ANSI styles that have a single enable code
  /// and a single disable code (e.g., bold, italic, basic colors).
  ///
  /// Parameters:
  /// - `enable`: The integer code to enable the ANSI style.
  /// - `disable`: The integer code to disable (reset) the ANSI style.
  factory Ansi(int enable, int disable) {
    return Ansi._([enable.toString()], [disable.toString()]);
  }

  /// Combines this `Ansi` instance with another `Ansi` instance.
  ///
  /// This method merges the `_codes` and `_resetCodes` lists from both instances,
  /// ensuring that duplicate codes are not added. This allows for chaining multiple
  /// ANSI styles together (e.g., bold and red).
  ///
  /// Parameters:
  /// - `other`: The `Ansi` instance to combine with this one.
  ///
  /// Returns: A new `Ansi` instance containing the combined styles.
  Ansi combine(Ansi other) {
    // Merge codes and reset codes, avoiding duplicates
    final codes = [..._codes, ...other._codes];
    final resetCodes = [..._resetCodes, ...other._resetCodes];
    return Ansi._(codes, resetCodes);
  }

  /// Overloads the `+` operator to combine two `Ansi` instances.
  ///
  /// This provides a convenient syntax for chaining ANSI styles, behaving identically
  /// to the `combine` method.
  ///
  /// Parameters:
  /// - `other`: The `Ansi` instance to add to this one.
  ///
  /// Returns: A new `Ansi` instance containing the combined styles.
  Ansi operator +(Ansi other) {
    // Merge codes and reset codes, avoiding duplicates
    final codes = [..._codes, ...other._codes];
    final resetCodes = [..._resetCodes, ...other._resetCodes];
    return Ansi._(codes, resetCodes);
  }

  /// Returns the ANSI escape sequence to enable the styles defined by this `Ansi` instance.
  String get on => '$_esc[${_codes.join(';')}m';

  /// Returns the ANSI escape sequence to disable (reset) the styles defined by this `Ansi` instance.
  String get off => '$_esc[${_resetCodes.join(';')}m';

  /// Applies the ANSI escape codes to the given input string.
  ///
  /// This method wraps the input string with the 'on' and 'off' ANSI sequences.
  /// It also handles nested ANSI codes by reapplying the 'on' sequence after
  /// any 'off' sequence found within the input, ensuring proper nesting of styles.
  ///
  /// Parameters:
  /// - `input`: The dynamic input data to be styled. It will be converted to a string using `stringify`.
  ///
  /// Returns: The styled string with ANSI escape codes applied.
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
  /// Resets all ANSI formatting to default.
  static Ansi get reset => Ansi(0, 0);

  /// Applies bold/increased intensity formatting.
  static Ansi get bold => Ansi(1, 22);

  /// Applies faint/decreased intensity formatting.
  static Ansi get faint => Ansi(2, 22);

  /// Applies italic formatting.
  static Ansi get italic => Ansi(3, 23);

  /// Applies underline formatting.
  static Ansi get underline => Ansi(4, 24);

  /// Applies slow blink formatting.
  static Ansi get slowBlink => Ansi(5, 25);

  /// Applies fast blink formatting.
  static Ansi get fastBlink => Ansi(6, 25);

  /// Applies inverse/reverse video formatting (swaps foreground and background colors).
  static Ansi get inverse => Ansi(7, 27);

  /// Applies conceal/hidden formatting.
  static Ansi get conceal => Ansi(8, 28);

  /// Applies strikethrough formatting.
  static Ansi get strikethrough => Ansi(9, 29);

  /// Resets to the default font.
  static Ansi get defaultFont => Ansi(10, 10);

  /// Applies double underline formatting.
  static Ansi get doubleUnderline => Ansi(21, 24);

  /// Applies superscript formatting.
  static Ansi get superscript => Ansi(73, 75);

  /// Applies subscript formatting.
  static Ansi get subscript => Ansi(74, 75);

  /// Applies overline formatting.
  static Ansi get overline => Ansi(53, 55);

  /// Applies framed formatting.
  static Ansi get framed => Ansi(51, 54);

  /// Applies encircled formatting.
  static Ansi get encircled => Ansi(52, 54);

  // ## 2. Alternate Fonts
  /// Sets an alternate font.
  ///
  /// Parameters:
  /// - `n`: The font number (1-9).
  ///
  /// Throws an `ArgumentError` if `n` is not between 1 and 9.
  static Ansi font(int n) {
    if (n < 1 || n > 9) {
      throw ArgumentError('Font number must be between 1 and 9');
    }
    return Ansi(10 + n, 10);
  }

  // ## 3. Foreground Colors
  /// Sets the foreground color to black.
  static Ansi get black => Ansi(30, _kResetFg);

  /// Sets the foreground color to red.
  static Ansi get red => Ansi(31, _kResetFg);

  /// Sets the foreground color to green.
  static Ansi get green => Ansi(32, _kResetFg);

  /// Sets the foreground color to yellow.
  static Ansi get yellow => Ansi(33, _kResetFg);

  /// Sets the foreground color to blue.
  static Ansi get blue => Ansi(34, _kResetFg);

  /// Sets the foreground color to magenta.
  static Ansi get magenta => Ansi(35, _kResetFg);

  /// Sets the foreground color to cyan.
  static Ansi get cyan => Ansi(36, _kResetFg);

  /// Sets the foreground color to white.
  static Ansi get white => Ansi(37, _kResetFg);

  /// Sets the foreground color to bright black.
  static Ansi get brightBlack => Ansi(90, _kResetFg);

  /// Sets the foreground color to bright red.
  static Ansi get brightRed => Ansi(91, _kResetFg);

  /// Sets the foreground color to bright green.
  static Ansi get brightGreen => Ansi(92, _kResetFg);

  /// Sets the foreground color to bright yellow.
  static Ansi get brightYellow => Ansi(93, _kResetFg);

  /// Sets the foreground color to bright blue.
  static Ansi get brightBlue => Ansi(94, _kResetFg);

  /// Sets the foreground color to bright magenta.
  static Ansi get brightMagenta => Ansi(95, _kResetFg);

  /// Sets the foreground color to bright cyan.
  static Ansi get brightCyan => Ansi(96, _kResetFg);

  /// Sets the foreground color to bright white.
  static Ansi get brightWhite => Ansi(97, _kResetFg);

  // ## 4. Background Colors
  /// Sets the background color to black.
  static Ansi get bgBlack => Ansi(40, _kResetBg);

  /// Sets the background color to red.
  static Ansi get bgRed => Ansi(41, _kResetBg);

  /// Sets the background color to green.
  static Ansi get bgGreen => Ansi(42, _kResetBg);

  /// Sets the background color to yellow.
  static Ansi get bgYellow => Ansi(43, _kResetBg);

  /// Sets the background color to blue.
  static Ansi get bgBlue => Ansi(44, _kResetBg);

  /// Sets the background color to magenta.
  static Ansi get bgMagenta => Ansi(45, _kResetBg);

  /// Sets the background color to cyan.
  static Ansi get bgCyan => Ansi(46, _kResetBg);

  /// Sets the background color to white.
  static Ansi get bgWhite => Ansi(47, _kResetBg);

  /// Sets the background color to bright black.
  static Ansi get bgBrightBlack => Ansi(100, _kResetBg);

  /// Sets the background color to bright red.
  static Ansi get bgBrightRed => Ansi(101, _kResetBg);

  /// Sets the background color to bright green.
  static Ansi get bgBrightGreen => Ansi(102, _kResetBg);

  /// Sets the background color to bright yellow.
  static Ansi get bgBrightYellow => Ansi(103, _kResetBg);

  /// Sets the background color to bright blue.
  static Ansi get bgBrightBlue => Ansi(104, _kResetBg);

  /// Sets the background color to bright magenta.
  static Ansi get bgBrightMagenta => Ansi(105, _kResetBg);

  /// Sets the background color to bright cyan.
  static Ansi get bgBrightCyan => Ansi(106, _kResetBg);

  /// Sets the background color to bright white.
  static Ansi get bgBrightWhite => Ansi(107, _kResetBg);

  /// Factory for 256-color foreground.
  ///
  /// Parameters:
  /// - `colorIndex`: The 256-color palette index (0-255).
  ///
  /// Throws an `ArgumentError` if `colorIndex` is not between 0 and 255.
  static Ansi fg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return Ansi._(['38;5;$colorIndex'], [_kResetFg.toString()]);
  }

  /// Factory for 256-color background.
  ///
  /// Parameters:
  /// - `colorIndex`: The 256-color palette index (0-255).
  ///
  /// Throws an `ArgumentError` if `colorIndex` is not between 0 and 255.
  static Ansi bg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return Ansi._(['48;5;$colorIndex'], [_kResetBg.toString()]);
  }

  /// Factory for true color (RGB) foreground.
  ///
  /// Parameters:
  /// - `r`: Red component (0-255).
  /// - `g`: Green component (0-255).
  /// - `b`: Blue component (0-255).
  ///
  /// Throws an `ArgumentError` if any RGB value is not between 0 and 255.
  static Ansi fgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return Ansi._(['38;2;$r;$g;$b'], [_kResetFg.toString()]);
  }

  /// Factory for true color (RGB) background.
  ///
  /// Parameters:
  /// - `r`: Red component (0-255).
  /// - `g`: Green component (0-255).
  /// - `b`: Blue component (0-255).
  ///
  /// Throws an `ArgumentError` if any RGB value is not between 0 and 255.
  static Ansi bgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return Ansi._(['48;2;$r;$g;$b'], [_kResetBg.toString()]);
  }

  /// Returns an empty `Ansi` instance.
  ///
  /// This can be used as a starting point for fluently chaining styles.
  static Ansi get empty => Ansi._([], []);

  // FLUENT CHAINING METHODS (with 'c' prefix for combining)
  // These return new Ansi instances combined with the current one

  // ## 1. Text Formatting (Fluent)
  /// Combines with the reset style.
  Ansi get cReset => combine(Ansi(0, 0));

  /// Combines with bold/increased intensity formatting.
  Ansi get cBold => combine(Ansi(1, 22));

  /// Combines with faint/decreased intensity formatting.
  Ansi get cFaint => combine(Ansi(2, 22));

  /// Combines with italic formatting.
  Ansi get cItalic => combine(Ansi(3, 23));

  /// Combines with underline formatting.
  Ansi get cUnderline => combine(Ansi(4, 24));

  /// Combines with slow blink formatting.
  Ansi get cSlowBlink => combine(Ansi(5, 25));

  /// Combines with fast blink formatting.
  Ansi get cFastBlink => combine(Ansi(6, 25));

  /// Combines with inverse/reverse video formatting.
  Ansi get cInverse => combine(Ansi(7, 27));

  /// Combines with conceal/hidden formatting.
  Ansi get cConceal => combine(Ansi(8, 28));

  /// Combines with strikethrough formatting.
  Ansi get cStrikethrough => combine(Ansi(9, 29));

  /// Combines with the default font.
  Ansi get cDefaultFont => combine(Ansi(10, 10));

  /// Combines with double underline formatting.
  Ansi get cDoubleUnderline => combine(Ansi(21, 24));

  /// Combines with superscript formatting.
  Ansi get cSuperscript => combine(Ansi(73, 75));

  /// Combines with subscript formatting.
  Ansi get cSubscript => combine(Ansi(74, 75));

  /// Combines with overline formatting.
  Ansi get cOverline => combine(Ansi(53, 55));

  /// Combines with framed formatting.
  Ansi get cFramed => combine(Ansi(51, 54));

  /// Combines with encircled formatting.
  Ansi get cEncircled => combine(Ansi(52, 54));

  // ## 2. Alternate Fonts (Fluent)
  /// Combines with an alternate font.
  ///
  /// Parameters:
  /// - `n`: The font number (1-9).
  ///
  /// Throws an `ArgumentError` if `n` is not between 1 and 9.
  Ansi cFont(int n) {
    if (n < 1 || n > 9) {
      throw ArgumentError('Font number must be between 1 and 9');
    }
    return combine(Ansi(10 + n, 10));
  }

  // ## 3. Foreground Colors (Fluent)
  /// Combines with black foreground color.
  Ansi get cBlack => combine(Ansi(30, _kResetFg));

  /// Combines with red foreground color.
  Ansi get cRed => combine(Ansi(31, _kResetFg));

  /// Combines with green foreground color.
  Ansi get cGreen => combine(Ansi(32, _kResetFg));

  /// Combines with yellow foreground color.
  Ansi get cYellow => combine(Ansi(33, _kResetFg));

  /// Combines with blue foreground color.
  Ansi get cBlue => combine(Ansi(34, _kResetFg));

  /// Combines with magenta foreground color.
  Ansi get cMagenta => combine(Ansi(35, _kResetFg));

  /// Combines with cyan foreground color.
  Ansi get cCyan => combine(Ansi(36, _kResetFg));

  /// Combines with white foreground color.
  Ansi get cWhite => combine(Ansi(37, _kResetFg));

  /// Combines with bright black foreground color.
  Ansi get cBrightBlack => combine(Ansi(90, _kResetFg));

  /// Combines with bright red foreground color.
  Ansi get cBrightRed => combine(Ansi(91, _kResetFg));

  /// Combines with bright green foreground color.
  Ansi get cBrightGreen => combine(Ansi(92, _kResetFg));

  /// Combines with bright yellow foreground color.
  Ansi get cBrightYellow => combine(Ansi(93, _kResetFg));

  /// Combines with bright blue foreground color.
  Ansi get cBrightBlue => combine(Ansi(94, _kResetFg));

  /// Combines with bright magenta foreground color.
  Ansi get cBrightMagenta => combine(Ansi(95, _kResetFg));

  /// Combines with bright cyan foreground color.
  Ansi get cBrightCyan => combine(Ansi(96, _kResetFg));

  /// Combines with bright white foreground color.
  Ansi get cBrightWhite => combine(Ansi(97, _kResetFg));

  // ## 4. Background Colors (Fluent)
  /// Combines with black background color.
  Ansi get cBgBlack => combine(Ansi(40, _kResetBg));

  /// Combines with red background color.
  Ansi get cBgRed => combine(Ansi(41, _kResetBg));

  /// Combines with green background color.
  Ansi get cBgGreen => combine(Ansi(42, _kResetBg));

  /// Combines with yellow background color.
  Ansi get cBgYellow => combine(Ansi(43, _kResetBg));

  /// Combines with blue background color.
  Ansi get cBgBlue => combine(Ansi(44, _kResetBg));

  /// Combines with magenta background color.
  Ansi get cBgMagenta => combine(Ansi(45, _kResetBg));

  /// Combines with cyan background color.
  Ansi get cBgCyan => combine(Ansi(46, _kResetBg));

  /// Combines with white background color.
  Ansi get cBgWhite => combine(Ansi(47, _kResetBg));

  /// Combines with bright black background color.
  Ansi get cBgBrightBlack => combine(Ansi(100, _kResetBg));

  /// Combines with bright red background color.
  Ansi get cBgBrightRed => combine(Ansi(101, _kResetBg));

  /// Combines with bright green background color.
  Ansi get cBgBrightGreen => combine(Ansi(102, _kResetBg));

  /// Combines with bright yellow background color.
  Ansi get cBgBrightYellow => combine(Ansi(103, _kResetBg));

  /// Combines with bright blue background color.
  Ansi get cBgBrightBlue => combine(Ansi(104, _kResetBg));

  /// Combines with bright magenta background color.
  Ansi get cBgBrightMagenta => combine(Ansi(105, _kResetBg));

  /// Combines with bright cyan background color.
  Ansi get cBgBrightCyan => combine(Ansi(106, _kResetBg));

  /// Combines with bright white background color.
  Ansi get cBgBrightWhite => combine(Ansi(107, _kResetBg));

  // ## 5. Extended color methods (Fluent)
  /// Combines with a 256-color foreground.
  ///
  /// Parameters:
  /// - `colorIndex`: The 256-color palette index (0-255).
  ///
  /// Throws an `ArgumentError` if `colorIndex` is not between 0 and 255.
  Ansi cFg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return combine(Ansi._(['38;5;$colorIndex'], [_kResetFg.toString()]));
  }

  /// Combines with a 256-color background.
  ///
  /// Parameters:
  /// - `colorIndex`: The 256-color palette index (0-255).
  ///
  /// Throws an `ArgumentError` if `colorIndex` is not between 0 and 255.
  Ansi cBg256(int colorIndex) {
    if (colorIndex < 0 || colorIndex > 255) {
      throw ArgumentError('Color index must be between 0 and 255');
    }
    return combine(Ansi._(['48;5;$colorIndex'], [_kResetBg.toString()]));
  }

  /// Combines with a true color (RGB) foreground.
  ///
  /// Parameters:
  /// - `r`: Red component (0-255).
  /// - `g`: Green component (0-255).
  /// - `b`: Blue component (0-255).
  ///
  /// Throws an `ArgumentError` if any RGB value is not between 0 and 255.
  Ansi cFgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return combine(Ansi._(['38;2;$r;$g;$b'], [_kResetFg.toString()]));
  }

  /// Combines with a true color (RGB) background.
  ///
  /// Parameters:
  /// - `r`: Red component (0-255).
  /// - `g`: Green component (0-255).
  /// - `b`: Blue component (0-255).
  ///
  /// Throws an `ArgumentError` if any RGB value is not between 0 and 255.
  Ansi cBgRgb(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255');
    }
    return combine(Ansi._(['48;2;$r;$g;$b'], [_kResetBg.toString()]));
  }
}
