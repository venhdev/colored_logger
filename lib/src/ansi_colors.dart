import 'package:colored_logger/src/ansi_code.dart';

/// A more user-friendly class for ANSI colors and styles with named constants.
///
/// This class provides a set of predefined color combinations and enhanced styles
/// that make it easier to create visually appealing terminal output.
/// It builds upon the basic ANSI codes but provides more semantic naming and
/// additional style options.
@Deprecated(
    'This class will be removed in a future release. Use `Ansi` class instead.')
class AnsiColors {
  /// Private constructor to prevent instantiation
  AnsiColors._();

  // Text decorations
  /// Blink text (not supported in all terminals)
  static const String blink = '\x1B[5m';

  /// Rapid blink text (not widely supported)
  static const String rapidBlink = '\x1B[6m';

  /// Reverse/invert the foreground and background colors
  static const String reverse = '\x1B[7m';

  /// Hidden text (not widely supported)
  static const String hidden = '\x1B[8m';

  /// Strikethrough text
  static const String strikethrough = '\x1B[9m';

  /// Double underline (not widely supported)
  static const String doubleUnderline = '\x1B[21m';

  /// Framed text (not widely supported)
  static const String framed = '\x1B[51m';

  /// Encircled text (not widely supported)
  static const String encircled = '\x1B[52m';

  /// Overlined text (not widely supported)
  static const String overlined = '\x1B[53m';

  // 8-bit color support (256 colors)
  /// Returns a foreground color using 8-bit color (256 colors)
  ///
  /// The color parameter should be between 0-255
  static String fg256(int color) => '\x1B[38;5;${color}m';

  /// Returns a background color using 8-bit color (256 colors)
  ///
  /// The color parameter should be between 0-255
  static String bg256(int color) => '\x1B[48;5;${color}m';

  // RGB true color support (16 million colors)
  /// Returns a foreground color using RGB values
  ///
  /// Each parameter (r,g,b) should be between 0-255
  static String fgRGB(int r, int g, int b) => '\x1B[38;2;$r;$g;${b}m';

  /// Returns a background color using RGB values
  ///
  /// Each parameter (r,g,b) should be between 0-255
  static String bgRGB(int r, int g, int b) => '\x1B[48;2;$r;$g;${b}m';

  // Predefined color combinations
  /// Error style: Bold red text
  static List<String> get error => [AnsiCode.bold, AnsiCode.red];

  /// Success style: Bold green text
  static List<String> get success => [AnsiCode.bold, AnsiCode.green];

  /// Warning style: Bold yellow text
  static List<String> get warning => [AnsiCode.bold, AnsiCode.yellow];

  /// Info style: Bold blue text
  static List<String> get info => [AnsiCode.bold, AnsiCode.blue];

  /// Debug style: Cyan text
  static List<String> get debug => [AnsiCode.cyan];

  /// Highlight style: Black text on yellow background
  static List<String> get highlight => [AnsiCode.black, AnsiCode.bgYellow];

  /// Alert style: White text on red background
  static List<String> get alert => [AnsiCode.white, AnsiCode.bgRed];

  /// Notice style: Black text on cyan background
  static List<String> get notice => [AnsiCode.black, AnsiCode.bgCyan];

  /// Primary style: Bold bright blue text
  static List<String> get primary => [AnsiCode.bold, AnsiCode.brightBlue];

  /// Secondary style: Bright magenta text
  static List<String> get secondary => [AnsiCode.brightMagenta];

  /// Tertiary style: Bright cyan text
  static List<String> get tertiary => [AnsiCode.brightCyan];

  /// Muted style: Dim white text
  static List<String> get muted => [AnsiCode.dim, AnsiCode.white];

  /// Emphasis style: Bold italic text
  static List<String> get emphasis => [AnsiCode.bold, AnsiCode.italic];

  /// Link style: Underlined cyan text
  static List<String> get link => [AnsiCode.underline, AnsiCode.cyan];

  /// Code style: Bright white text on bright black background
  static List<String> get code =>
      [AnsiCode.brightWhite, AnsiCode.bgBrightBlack];

  /// Quote style: Italic green text
  static List<String> get quote => [AnsiCode.italic, AnsiCode.green];

  /// Header style: Bold underlined bright white text
  static List<String> get header =>
      [AnsiCode.bold, AnsiCode.underline, AnsiCode.brightWhite];

  /// Subheader style: Underlined bright white text
  static List<String> get subheader =>
      [AnsiCode.underline, AnsiCode.brightWhite];

  // Common color names with RGB values
  /// Coral color (RGB: 255, 127, 80)
  static String get coral => fgRGB(255, 127, 80);

  /// Tomato color (RGB: 255, 99, 71)
  static String get tomato => fgRGB(255, 99, 71);

  /// Orange red color (RGB: 255, 69, 0)
  static String get orangeRed => fgRGB(255, 69, 0);

  /// Gold color (RGB: 255, 215, 0)
  static String get gold => fgRGB(255, 215, 0);

  /// Lime green color (RGB: 50, 205, 50)
  static String get limeGreen => fgRGB(50, 205, 50);

  /// Forest green color (RGB: 34, 139, 34)
  static String get forestGreen => fgRGB(34, 139, 34);

  /// Teal color (RGB: 0, 128, 128)
  static String get teal => fgRGB(0, 128, 128);

  /// Deep sky blue color (RGB: 0, 191, 255)
  static String get deepSkyBlue => fgRGB(0, 191, 255);

  /// Royal blue color (RGB: 65, 105, 225)
  static String get royalBlue => fgRGB(65, 105, 225);

  /// Navy blue color (RGB: 0, 0, 128)
  static String get navyBlue => fgRGB(0, 0, 128);

  /// Purple color (RGB: 128, 0, 128)
  static String get purple => fgRGB(128, 0, 128);

  /// Violet color (RGB: 238, 130, 238)
  static String get violet => fgRGB(238, 130, 238);

  /// Hot pink color (RGB: 255, 105, 180)
  static String get hotPink => fgRGB(255, 105, 180);

  /// Deep pink color (RGB: 255, 20, 147)
  static String get deepPink => fgRGB(255, 20, 147);

  /// Chocolate color (RGB: 210, 105, 30)
  static String get chocolate => fgRGB(210, 105, 30);

  /// Sienna color (RGB: 160, 82, 45)
  static String get sienna => fgRGB(160, 82, 45);

  /// Silver color (RGB: 192, 192, 192)
  static String get silver => fgRGB(192, 192, 192);

  /// Gray color (RGB: 128, 128, 128)
  static String get gray => fgRGB(128, 128, 128);

  /// Slate gray color (RGB: 112, 128, 144)
  static String get slateGray => fgRGB(112, 128, 144);
}
