# Colored Logger

A simple yet powerful colored logging utility for Dart and Flutter applications that enhances console output with ANSI colors and styles.

![Screenshot](https://raw.githubusercontent.com/venhdev/colored_logger/main/screenshots/image.png)

## Features

- **Color-coded log levels**: Easily distinguish between different types of logs (info, success, warning, error)
- **Custom logging**: Create your own colored log messages with custom prefixes
- **ANSI color support**: Includes a variety of ANSI color codes for terminal output
- **RGB & 256 color support**: Create millions of colors with true color RGB and 8-bit color support
- **Predefined styles**: Ready-to-use semantic styles like error, success, warning, info, and more
- **Named colors**: Common color names like coral, gold, teal, and more for easy styling
- **Advanced text styling**: Support for strikethrough, blink, reverse, and more text decorations
- **Lightweight**: Minimal dependencies, just import and use
- **Easy to use**: Simple static methods for quick implementation

## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  colored_logger: ^1.1.0
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

### AnsiCode Class

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

#### Utility Methods

- `AnsiCode.getColorByName(String color)` - Returns the common ANSI code for a given color name

### AnsiColors Class

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

#### colorizeText

The package provides a utility function to directly colorize text with ANSI codes:

```dart
String colorizeText(
  dynamic text, {
  List<String> ansiCodes = const [AnsiCode.normal],
  List<String> forwardTo = const [AnsiCode.normal],
  String? ansiStyle,
  String prefix = '',
  String suffix = '',
})
```

Parameters:

- `text`: The text to colorize, maybe a function that returns a String
- `ansiCodes`: List of ANSI codes to apply to the text (default: `[AnsiCode.normal]`)
- `forwardTo`: List of ANSI codes to apply after the text (default: `[AnsiCode.normal]`). Used to forward styling to the next line or reset to normal
- `ansiStyle`: Optional string of ANSI codes to apply (takes precedence over ansiCodes if provided)
- `prefix`: Optional prefix to add before the text (default: empty string)
- `suffix`: Optional suffix to add after the text (default: empty string)

Example usage:

```dart
import 'package:colored_logger/colored_logger.dart';

// Colorize text with a single ANSI code
String greenText = colorizeText('This text is green', ansiCodes: [AnsiCode.green]);
print(greenText);

// Colorize text with multiple ANSI codes
String boldCyanText = colorizeText(
  'This text is bold and cyan',
  ansiCodes: [AnsiCode.bold, AnsiCode.cyan]
);
print(boldCyanText);

// Using RGB colors
String rgbText = colorizeText(
  'This text uses RGB color',
  ansiCodes: [AnsiCode.fgRGB(255, 100, 50)]
);
print(rgbText);

// Using predefined styles from AnsiColors
String errorText = colorizeText(
  'This is an error message',
  ansiCodes: AnsiColors.error
);
print(errorText);

// Using named colors from AnsiColors
String goldText = colorizeText(
  'This text is gold colored',
  ansiCodes: [AnsiColors.gold]
);
print(goldText);

// Colorize multiline text (each line gets colored separately)
String multilineText = colorizeText(
  'Line 1\nLine 2\nLine 3',
  ansiCodes: [AnsiCode.yellow]
);
print(multilineText);

// Using prefix and suffix
String prefixedText = colorizeText(
  'Important message',
  ansiCodes: [AnsiCode.bold, AnsiCode.red],
  prefix: '[ALERT] ',
  suffix: ' !'
);
print(prefixedText);

// Preserve color after text (for continued styling)
String preservedColorText = colorizeText(
  'This begins a colored section',
  ansiCodes: [AnsiCode.red],
  forwardTo: [AnsiCode.red] // Continue with red text after this
);
print(preservedColorText + ' and this continues in the same color');
```

This function properly handles multiline text by applying the color codes to each line individually.

## Example

See the [example](example/example.dart) for a complete working example.

## Additional Information

- **Repository**: [GitHub](https://github.com/venhdev/colored_logger)
- **Homepage**: [venhdev.me](https://www.venhdev.me)
- **Issues**: Please file issues on the [GitHub repository](https://github.com/venhdev/colored_logger/issues)
- **Contributions**: Contributions are welcome! Feel free to submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
