# Colored Logger

A simple yet powerful colored logging utility for Dart and Flutter applications that enhances console output with ANSI colors and styles.

[![pub package](https://img.shields.io/pub/v/colored_logger.svg)](https://pub.dev/packages/colored_logger)

![Screenshot](https://raw.githubusercontent.com/venhdev/colored_logger/main/screenshots/image.png)

## Features

- **Color-coded log levels**: Easily distinguish between different types of logs (info, success, warning, error)
- **ANSI color support**: Includes a variety of ANSI color codes for terminal output
- **RGB & 256 color support**: Create millions of colors with true color RGB and 8-bit color support
- **Predefined styles**: Ready-to-use semantic styles, colors, text decorations

## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  colored_logger: ^1.2.3
```

Then run:

```bash
flutter pub get
```

Or with Dart:

```bash
dart pub get
```

## Usage

### Basic Usage

```dart
import 'package:colored_logger/colored_logger.dart';

void main() {
  // Basic usage with predefined log levels
  ColoredLogger.info('This is an info message');
  ColoredLogger.success('Operation completed successfully');
  ColoredLogger.warning('This is a warning message');
  ColoredLogger.error('An error occurred');
}
```

### Custom Logging

```dart
import 'package:colored_logger/colored_logger.dart';

void main() {
  // Custom colored message with a specific color name
  ColoredLogger.custom('Custom message with color name',
      colorName: 'magenta',
      prefix: '[CUSTOM] ');

  // Custom colored message with ANSI codes
  ColoredLogger.custom('Custom message with ANSI codes',
      ansiCodes: [AnsiCode.bold, AnsiCode.cyan],
      prefix: '[STYLED] ');
      
  // Using predefined styles from AnsiColors
  ColoredLogger.custom('Error style message', 
      ansiCodes: AnsiColors.error,
      prefix: '[ERROR] ');
}
```

## API Documentation

### ColoredLogger Class

The `ColoredLogger` class provides static methods for logging messages with different colors and styles.

#### Basic Logging Methods

- `ColoredLogger.info(String message, {String prefix = '[INFO] '})` - Logs an info message in blue
- `ColoredLogger.success(String message, {String prefix = '[SUCCESS] '})` - Logs a success message in green
- `ColoredLogger.warning(String message, {String prefix = '[WARNING] '})` - Logs a warning message in yellow
- `ColoredLogger.error(String message, {String prefix = '[ERROR] '})` - Logs an error message in red

#### Custom Logging

```dart
ColoredLogger.custom(
  String message, {
  String prefix = '',
  String colorName = 'normal',
  List<String>? ansiCodes,
})
```

Parameters:

- `message`: The message to log
- `prefix`: Optional prefix to add before the message (default: empty string)
- `colorName`: Color name to use (e.g., 'red', 'green', 'blue')
- `ansiCodes`: List of ANSI codes to apply (takes precedence over colorName if provided)
- `colored`: If false, the message will not be colored (default: true)

### AnsiCode Class

**Deprecated**: The `AnsiCode` class is deprecated and will be removed in a future release (v2.0.0). Use the `Ansi` class instead.

The `AnsiCode` class provides ANSI escape codes for terminal text styling.

#### Text Styles

- `AnsiCode.normal` - Reset to normal style
- `AnsiCode.bold` - Bold text
- `AnsiCode.dim` - Dimmed text
- `AnsiCode.italic` - Italic text
- `AnsiCode.underline` - Underlined text
- `AnsiCode.blink` - Blinking text (not supported in all terminals)
- `AnsiCode.reverse` - Reverse/invert foreground and background colors
- `AnsiCode.hidden` - Hidden/invisible text
- `AnsiCode.strikethrough` - Strikethrough text

#### Foreground Colors

- `AnsiCode.black` - Black text
- `AnsiCode.red` - Red text
- `AnsiCode.green` - Green text
- `AnsiCode.yellow` - Yellow text
- `AnsiCode.blue` - Blue text
- `AnsiCode.magenta` - Magenta text
- `AnsiCode.cyan` - Cyan text
- `AnsiCode.white` - White text

#### Bright Foreground Colors

- `AnsiCode.brightRed` - Bright red text
- `AnsiCode.brightGreen` - Bright green text
- `AnsiCode.brightYellow` - Bright yellow text
- `AnsiCode.brightBlue` - Bright blue text
- `AnsiCode.brightMagenta` - Bright magenta text
- `AnsiCode.brightCyan` - Bright cyan text
- `AnsiCode.brightWhite` - Bright white text

#### Background Colors

- `AnsiCode.bgBlack` - Black background
- `AnsiCode.bgRed` - Red background
- `AnsiCode.bgGreen` - Green background
- `AnsiCode.bgYellow` - Yellow background
- `AnsiCode.bgBlue` - Blue background
- `AnsiCode.bgMagenta` - Magenta background
- `AnsiCode.bgCyan` - Cyan background
- `AnsiCode.bgWhite` - White background

#### Advanced Color Methods

- `AnsiCode.fg256(int color)` - Returns a foreground color using 8-bit color (256 colors)
- `AnsiCode.bg256(int color)` - Returns a background color using 8-bit color (256 colors)
- `AnsiCode.fgRGB(int r, int g, int b)` - Returns a foreground color using RGB values
- `AnsiCode.bgRGB(int r, int g, int b)` - Returns a background color using RGB values

### AnsiColors Class

**Deprecated**: The `AnsiColors` class is deprecated and will be removed in a future release (v2.0.0). Use the `Ansi` class instead.

The `AnsiColors` class provides enhanced styling options and predefined color combinations for terminal output.

#### Text Decorations

- `AnsiColors.blink` - Blink text (not supported in all terminals)
- `AnsiColors.rapidBlink` - Rapid blink text (not widely supported)
- `AnsiColors.reverse` - Reverse/invert foreground and background colors
- `AnsiColors.hidden` - Hidden text (not widely supported)
- `AnsiColors.strikethrough` - Strikethrough text
- `AnsiColors.doubleUnderline` - Double underline (not widely supported)
- `AnsiColors.framed` - Framed text (not widely supported)
- `AnsiColors.encircled` - Encircled text (not widely supported)
- `AnsiColors.overlined` - Overlined text (not widely supported)

#### Advanced Color Methods

- `AnsiColors.fg256(int color)` - Returns a foreground color using 8-bit color (256 colors)
- `AnsiColors.bg256(int color)` - Returns a background color using 8-bit color (256 colors)
- `AnsiColors.fgRGB(int r, int g, int b)` - Returns a foreground color using RGB values
- `AnsiColors.bgRGB(int r, int g, int b)` - Returns a background color using RGB values

#### Predefined Styles

- `AnsiColors.error` - Bold red text (for error messages)
- `AnsiColors.success` - Bold green text (for success messages)
- `AnsiColors.warning` - Bold yellow text (for warning messages)
- `AnsiColors.info` - Bold blue text (for info messages)
- `AnsiColors.debug` - Cyan text (for debug messages)
- `AnsiColors.highlight` - Black text on yellow background
- `AnsiColors.alert` - White text on red background
- `AnsiColors.notice` - Black text on cyan background
- `AnsiColors.primary` - Bold bright blue text
- `AnsiColors.secondary` - Bright magenta text
- `AnsiColors.tertiary` - Bright cyan text
- `AnsiColors.muted` - Dim white text
- `AnsiColors.emphasis` - Bold italic text
- `AnsiColors.link` - Underlined cyan text
- `AnsiColors.code` - Bright white text on bright black background
- `AnsiColors.quote` - Italic green text
- `AnsiColors.header` - Bold underlined bright white text
- `AnsiColors.subheader` - Underlined bright white text

#### Named Colors

- `AnsiColors.coral` - Coral color (RGB: 255, 127, 80)
- `AnsiColors.tomato` - Tomato color (RGB: 255, 99, 71)
- `AnsiColors.orangeRed` - Orange red color (RGB: 255, 69, 0)
- `AnsiColors.gold` - Gold color (RGB: 255, 215, 0)
- `AnsiColors.limeGreen` - Lime green color (RGB: 50, 205, 50)
- `AnsiColors.forestGreen` - Forest green color (RGB: 34, 139, 34)
- `AnsiColors.teal` - Teal color (RGB: 0, 128, 128)
- `AnsiColors.deepSkyBlue` - Deep sky blue color (RGB: 0, 191, 255)
- `AnsiColors.royalBlue` - Royal blue color (RGB: 65, 105, 225)
- `AnsiColors.navyBlue` - Navy blue color (RGB: 0, 0, 128)
- `AnsiColors.purple` - Purple color (RGB: 128, 0, 128)
- `AnsiColors.violet` - Violet color (RGB: 238, 130, 238)
- `AnsiColors.hotPink` - Hot pink color (RGB: 255, 105, 180)
- `AnsiColors.deepPink` - Deep pink color (RGB: 255, 20, 147)
- `AnsiColors.chocolate` - Chocolate color (RGB: 210, 105, 30)
- `AnsiColors.sienna` - Sienna color (RGB: 160, 82, 45)
- `AnsiColors.silver` - Silver color (RGB: 192, 192, 192)
- `AnsiColors.gray` - Gray color (RGB: 128, 128, 128)
- `AnsiColors.slateGray` - Slate gray color (RGB: 112, 128, 144)

### Utility Functions

#### colorize

The package provides a new utility function to directly colorize text with ANSI codes using the `Ansi` class:

```dart
String colorize(
  dynamic input,
  Ansi ansi, {
  String prefix = '',
  String suffix = '',
  bool colored = true,
})
```

Parameters:

- `input`: The text to colorize.
- `ansi`: The `Ansi` code to apply to the text.
- `prefix`: An optional prefix to add before the text.
- `suffix`: An optional suffix to add after the text.
- `colored`: If `false`, the text will not be colored.

Example usage:

```dart
import 'package:colored_logger/colored_logger.dart';

// Colorize text with a single ANSI code
String greenText = colorize('This text is green', Ansi.green);
print(greenText);

// Colorize text with multiple ANSI codes
String boldCyanText = colorize(
  'This text is bold and cyan',
  Ansi.bold.combine(Ansi.cyan)
);
print(boldCyanText);

// Using RGB colors
String rgbText = colorize(
  'This text uses RGB color',
  Ansi.fgRgb(255, 100, 50)
);
print(rgbText);

// Using predefined styles from Ansi
String errorText = colorize(
  'This is an error message',
  Ansi.red.bold
);
print(errorText);

// Using prefix and suffix
String prefixedText = colorize(
  'Important message',
  Ansi.red.bold,
  prefix: '[ALERT] ',
  suffix: ' !'
);
print(prefixedText);
```

**Deprecated**: The `colorizeText` function is deprecated and will be removed in a future release (v2.0.0). Use `colorize` instead.

## Example

See the [example](example/example.dart) for a complete working example.

## Additional Information

- **Repository**: [GitHub](https://github.com/venhdev/colored_logger)
- **Homepage**: [venhdev.me](https://www.venhdev.me)
- **Issues**: Please file issues on the [GitHub repository](https://github.com/venhdev/colored_logger/issues)
- **Contributions**: Contributions are welcome! Feel free to submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
