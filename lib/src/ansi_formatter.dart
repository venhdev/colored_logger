// # ANSI Escape Code Chaining for Dart

// This file implements a system for chaining ANSI escape codes in Dart using extension methods.

// ```dart
// Define ANSI escape code constants
class AnsiCodes {
  // Reset
  static const int reset = 0;

  // Styles
  static const int bold = 1;
  static const int dim = 2;
  static const int italic = 3;
  static const int underline = 4;
  static const int blink = 5;
  static const int reverse = 7;
  static const int hidden = 8;
  static const int strikethrough = 9;

  // Foreground Colors (30-37)
  static const int black = 30;
  static const int red = 31;
  static const int green = 32;
  static const int yellow = 33;
  static const int blue = 34;
  static const int magenta = 35;
  static const int cyan = 36;
  static const int white = 37;

  // Bright Foreground Colors (90-97)
  static const int brightBlack = 90; // Often gray
  static const int brightRed = 91;
  static const int brightGreen = 92;
  static const int brightYellow = 93;
  static const int brightBlue = 94;
  static const int brightMagenta = 95;
  static const int brightCyan = 96;
  static const int brightWhite = 97;

  // Background Colors (40-47)
  static const int bgBlack = 40;
  static const int bgRed = 41;
  static const int bgGreen = 42;
  static const int bgYellow = 43;
  static const int bgBlue = 44;
  static const int bgMagenta = 45;
  static const int bgCyan = 46;
  static const int bgWhite = 47;

  // Bright Background Colors (100-107)
  static const int bgBrightBlack = 100;
  static const int bgBrightRed = 101;
  static const int bgBrightGreen = 102;
  static const int bgBrightYellow = 103;
  static const int bgBrightBlue = 104;
  static const int bgBrightMagenta = 105;
  static const int bgBrightCyan = 106;
  static const int bgBrightWhite = 107;
}

// Wrapper class to hold text and accumulated ANSI codes
class AnsiStyledText {
  final String text;
  final List<int> codes;

  // Private constructor to ensure controlled creation
  AnsiStyledText._(this.text, this.codes);

  // Factory constructor for initial creation from String
  factory AnsiStyledText(String text, int initialCode) {
    return AnsiStyledText._(text, [initialCode]);
  }

  // Method to add a new code (returns a new instance)
  AnsiStyledText addCode(int code) {
    // Avoid adding duplicate codes if desired (optional)
    // if (codes.contains(code)) return this;
    final newCodes = List<int>.from(codes)..add(code);
    return AnsiStyledText._(text, newCodes);
  }

  @override
  String toString() {
    if (codes.isEmpty) {
      return text;
    }
    // \x1B is the ESC character
    final joinedCodes = codes.join(";");
    return "\x1B[${joinedCodes}m${text}\x1B[${AnsiCodes.reset}m";
  }
}
// ```



// Extension on String to start the styling chain
extension AnsiStringExtension on String {
  // Styles
  AnsiStyledText get bold => AnsiStyledText(this, AnsiCodes.bold);
  AnsiStyledText get dim => AnsiStyledText(this, AnsiCodes.dim);
  AnsiStyledText get italic => AnsiStyledText(this, AnsiCodes.italic);
  AnsiStyledText get underline => AnsiStyledText(this, AnsiCodes.underline);
  AnsiStyledText get blink => AnsiStyledText(this, AnsiCodes.blink);
  AnsiStyledText get reverse => AnsiStyledText(this, AnsiCodes.reverse);
  AnsiStyledText get hidden => AnsiStyledText(this, AnsiCodes.hidden);
  AnsiStyledText get strikethrough => AnsiStyledText(this, AnsiCodes.strikethrough);

  // Foreground Colors
  AnsiStyledText get black => AnsiStyledText(this, AnsiCodes.black);
  AnsiStyledText get red => AnsiStyledText(this, AnsiCodes.red);
  AnsiStyledText get green => AnsiStyledText(this, AnsiCodes.green);
  AnsiStyledText get yellow => AnsiStyledText(this, AnsiCodes.yellow);
  AnsiStyledText get blue => AnsiStyledText(this, AnsiCodes.blue);
  AnsiStyledText get magenta => AnsiStyledText(this, AnsiCodes.magenta);
  AnsiStyledText get cyan => AnsiStyledText(this, AnsiCodes.cyan);
  AnsiStyledText get white => AnsiStyledText(this, AnsiCodes.white);

  // Bright Foreground Colors
  AnsiStyledText get brightBlack => AnsiStyledText(this, AnsiCodes.brightBlack);
  AnsiStyledText get brightRed => AnsiStyledText(this, AnsiCodes.brightRed);
  AnsiStyledText get brightGreen => AnsiStyledText(this, AnsiCodes.brightGreen);
  AnsiStyledText get brightYellow => AnsiStyledText(this, AnsiCodes.brightYellow);
  AnsiStyledText get brightBlue => AnsiStyledText(this, AnsiCodes.brightBlue);
  AnsiStyledText get brightMagenta => AnsiStyledText(this, AnsiCodes.brightMagenta);
  AnsiStyledText get brightCyan => AnsiStyledText(this, AnsiCodes.brightCyan);
  AnsiStyledText get brightWhite => AnsiStyledText(this, AnsiCodes.brightWhite);

  // Background Colors
  AnsiStyledText get bgBlack => AnsiStyledText(this, AnsiCodes.bgBlack);
  AnsiStyledText get bgRed => AnsiStyledText(this, AnsiCodes.bgRed);
  AnsiStyledText get bgGreen => AnsiStyledText(this, AnsiCodes.bgGreen);
  AnsiStyledText get bgYellow => AnsiStyledText(this, AnsiCodes.bgYellow);
  AnsiStyledText get bgBlue => AnsiStyledText(this, AnsiCodes.bgBlue);
  AnsiStyledText get bgMagenta => AnsiStyledText(this, AnsiCodes.bgMagenta);
  AnsiStyledText get bgCyan => AnsiStyledText(this, AnsiCodes.bgCyan);
  AnsiStyledText get bgWhite => AnsiStyledText(this, AnsiCodes.bgWhite);

  // Bright Background Colors
  AnsiStyledText get bgBrightBlack => AnsiStyledText(this, AnsiCodes.bgBrightBlack);
  AnsiStyledText get bgBrightRed => AnsiStyledText(this, AnsiCodes.bgBrightRed);
  AnsiStyledText get bgBrightGreen => AnsiStyledText(this, AnsiCodes.bgBrightGreen);
  AnsiStyledText get bgBrightYellow => AnsiStyledText(this, AnsiCodes.bgBrightYellow);
  AnsiStyledText get bgBrightBlue => AnsiStyledText(this, AnsiCodes.bgBrightBlue);
  AnsiStyledText get bgBrightMagenta => AnsiStyledText(this, AnsiCodes.bgBrightMagenta);
  AnsiStyledText get bgBrightCyan => AnsiStyledText(this, AnsiCodes.bgBrightCyan);
  AnsiStyledText get bgBrightWhite => AnsiStyledText(this, AnsiCodes.bgBrightWhite);
}

// Extension on AnsiStyledText to continue the styling chain
extension AnsiStyledTextExtension on AnsiStyledText {
  // Styles
  AnsiStyledText get bold => addCode(AnsiCodes.bold);
  AnsiStyledText get dim => addCode(AnsiCodes.dim);
  AnsiStyledText get italic => addCode(AnsiCodes.italic);
  AnsiStyledText get underline => addCode(AnsiCodes.underline);
  AnsiStyledText get blink => addCode(AnsiCodes.blink);
  AnsiStyledText get reverse => addCode(AnsiCodes.reverse);
  AnsiStyledText get hidden => addCode(AnsiCodes.hidden);
  AnsiStyledText get strikethrough => addCode(AnsiCodes.strikethrough);

  // Foreground Colors
  AnsiStyledText get black => addCode(AnsiCodes.black);
  AnsiStyledText get red => addCode(AnsiCodes.red);
  AnsiStyledText get green => addCode(AnsiCodes.green);
  AnsiStyledText get yellow => addCode(AnsiCodes.yellow);
  AnsiStyledText get blue => addCode(AnsiCodes.blue);
  AnsiStyledText get magenta => addCode(AnsiCodes.magenta);
  AnsiStyledText get cyan => addCode(AnsiCodes.cyan);
  AnsiStyledText get white => addCode(AnsiCodes.white);

  // Bright Foreground Colors
  AnsiStyledText get brightBlack => addCode(AnsiCodes.brightBlack);
  AnsiStyledText get brightRed => addCode(AnsiCodes.brightRed);
  AnsiStyledText get brightGreen => addCode(AnsiCodes.brightGreen);
  AnsiStyledText get brightYellow => addCode(AnsiCodes.brightYellow);
  AnsiStyledText get brightBlue => addCode(AnsiCodes.brightBlue);
  AnsiStyledText get brightMagenta => addCode(AnsiCodes.brightMagenta);
  AnsiStyledText get brightCyan => addCode(AnsiCodes.brightCyan);
  AnsiStyledText get brightWhite => addCode(AnsiCodes.brightWhite);

  // Background Colors
  AnsiStyledText get bgBlack => addCode(AnsiCodes.bgBlack);
  AnsiStyledText get bgRed => addCode(AnsiCodes.bgRed);
  AnsiStyledText get bgGreen => addCode(AnsiCodes.bgGreen);
  AnsiStyledText get bgYellow => addCode(AnsiCodes.bgYellow);
  AnsiStyledText get bgBlue => addCode(AnsiCodes.bgBlue);
  AnsiStyledText get bgMagenta => addCode(AnsiCodes.bgMagenta);
  AnsiStyledText get bgCyan => addCode(AnsiCodes.bgCyan);
  AnsiStyledText get bgWhite => addCode(AnsiCodes.bgWhite);

  // Bright Background Colors
  AnsiStyledText get bgBrightBlack => addCode(AnsiCodes.bgBrightBlack);
  AnsiStyledText get bgBrightRed => addCode(AnsiCodes.bgBrightRed);
  AnsiStyledText get bgBrightGreen => addCode(AnsiCodes.bgBrightGreen);
  AnsiStyledText get bgBrightYellow => addCode(AnsiCodes.bgBrightYellow);
  AnsiStyledText get bgBrightBlue => addCode(AnsiCodes.bgBrightBlue);
  AnsiStyledText get bgBrightMagenta => addCode(AnsiCodes.bgBrightMagenta);
  AnsiStyledText get bgBrightCyan => addCode(AnsiCodes.bgBrightCyan);
  AnsiStyledText get bgBrightWhite => addCode(AnsiCodes.bgBrightWhite);
}

// Example Usage (can be placed in a main function)
void main() {
  print('Hello'.red);
  print('Hello'.red.bold);
  print('Hello'.green.italic.underline);
  print('Hello'.blue.bgYellow.bold);
  print('Multiple'.cyan.bold.strikethrough.bgWhite);

  // Test reset
  print('This is ${'important'.red.bold} text.');
}
// ```
