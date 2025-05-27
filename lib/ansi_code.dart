/// A utility class that provides ANSI escape codes for terminal text styling.
///
/// This class contains static constants for various ANSI codes that can be used
/// to style text output in terminal environments that support ANSI escape sequences.
/// It includes codes for text styles, foreground colors, background colors, and more.
class AnsiCode {
  // Standard foreground colors
  /// Reset all styles and colors to default
  static const String reset = '\x1B[0m';

  /// Reset to normal style
  static const String normal = '\x1B[0m';

  /// Bold text style
  static const String bold = '\x1B[1m';

  /// Dimmed text style
  static const String dim = '\x1B[2m';

  /// Italic text style
  static const String italic = '\x1B[3m';

  /// Underlined text style
  static const String underline = '\x1B[4m';

  /// Black text color
  static const String black = '\x1B[30m';

  /// Red text color
  static const String red = '\x1B[31m';

  /// Green text color
  static const String green = '\x1B[32m';

  /// Yellow text color
  static const String yellow = '\x1B[33m';

  /// Blue text color
  static const String blue = '\x1B[34m';

  /// Magenta text color
  static const String magenta = '\x1B[35m';

  /// Cyan text color
  static const String cyan = '\x1B[36m';

  /// White text color
  static const String white = '\x1B[37m';

  // Bright foreground colors
  /// Bright black (gray) text color
  static const String brightBlack = '\x1B[90m';

  /// Bright red text color
  static const String brightRed = '\x1B[91m';

  /// Bright green text color
  static const String brightGreen = '\x1B[92m';

  /// Bright yellow text color
  static const String brightYellow = '\x1B[93m';

  /// Bright blue text color
  static const String brightBlue = '\x1B[94m';

  /// Bright magenta text color
  static const String brightMagenta = '\x1B[95m';

  /// Bright cyan text color
  static const String brightCyan = '\x1B[96m';

  /// Bright white text color
  static const String brightWhite = '\x1B[97m';

  // Background colors
  /// Black background color
  static const String bgBlack = '\x1B[40m';

  /// Red background color
  static const String bgRed = '\x1B[41m';

  /// Green background color
  static const String bgGreen = '\x1B[42m';

  /// Yellow background color
  static const String bgYellow = '\x1B[43m';

  /// Blue background color
  static const String bgBlue = '\x1B[44m';

  /// Magenta background color
  static const String bgMagenta = '\x1B[45m';

  /// Cyan background color
  static const String bgCyan = '\x1B[46m';

  /// White background color
  static const String bgWhite = '\x1B[47m';

  // Bright background colors
  /// Bright black (gray) background color
  static const String bgBrightBlack = '\x1B[100m';

  /// Bright red background color
  static const String bgBrightRed = '\x1B[101m';

  /// Bright green background color
  static const String bgBrightGreen = '\x1B[102m';

  /// Bright yellow background color
  static const String bgBrightYellow = '\x1B[103m';

  /// Bright blue background color
  static const String bgBrightBlue = '\x1B[104m';

  /// Bright magenta background color
  static const String bgBrightMagenta = '\x1B[105m';

  /// Bright cyan background color
  static const String bgBrightCyan = '\x1B[106m';

  /// Bright white background color
  static const String bgBrightWhite = '\x1B[107m';

  /// Returns the ANSI code for a given color name.
  ///
  /// This method takes a color name as a string and returns the corresponding
  /// ANSI code. If the color name is not recognized, it returns null.
  ///
  /// Example:
  /// ```dart
  /// final redCode = AnsiCode.getColorByName('red'); // Returns '\x1B[31m'
  /// ```
  static String? getColorByName(String name) {
    switch (name.toLowerCase()) {
      case 'reset':
      case 'normal':
        return reset;
      case 'bold':
        return bold;
      case 'dim':
        return dim;
      case 'italic':
        return italic;
      case 'underline':
        return underline;

      case 'black':
        return black;
      case 'red':
        return red;
      case 'green':
        return green;
      case 'yellow':
        return yellow;
      case 'blue':
        return blue;
      case 'magenta':
        return magenta;
      case 'cyan':
        return cyan;
      case 'white':
        return white;

      case 'brightblack':
        return brightBlack;
      case 'brightred':
        return brightRed;
      case 'brightgreen':
        return brightGreen;
      case 'brightyellow':
        return brightYellow;
      case 'brightblue':
        return brightBlue;
      case 'brightmagenta':
        return brightMagenta;
      case 'brightcyan':
        return brightCyan;
      case 'brightwhite':
        return brightWhite;

      case 'bgblack':
        return bgBlack;
      case 'bgred':
        return bgRed;
      case 'bggreen':
        return bgGreen;
      case 'bgyellow':
        return bgYellow;
      case 'bgblue':
        return bgBlue;
      case 'bgmagenta':
        return bgMagenta;
      case 'bgcyan':
        return bgCyan;
      case 'bgwhite':
        return bgWhite;

      case 'bgbrightblack':
        return bgBrightBlack;
      case 'bgbrightred':
        return bgBrightRed;
      case 'bgbrightgreen':
        return bgBrightGreen;
      case 'bgbrightyellow':
        return bgBrightYellow;
      case 'bgbrightblue':
        return bgBrightBlue;
      case 'bgbrightmagenta':
        return bgBrightMagenta;
      case 'bgbrightcyan':
        return bgBrightCyan;
      case 'bgbrightwhite':
        return bgBrightWhite;

      default:
        return null;
    }
  }
}
