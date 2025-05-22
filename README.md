# Colored Logger

A simple yet powerful colored logging utility for Dart and Flutter applications that enhances console output with ANSI colors.

## Features

- **Color-coded log levels**: Easily distinguish between different types of logs (info, success, warning, error)
- **Custom logging**: Create your own colored log messages with custom prefixes
- **ANSI color support**: Includes a variety of ANSI color codes for terminal output
- **Lightweight**: Minimal dependencies, just import and use
- **Easy to use**: Simple static methods for quick implementation

## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  colored_logger: ^0.0.1
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
import 'package:colored_logger/ansi_code.dart';

void main() {
  // Custom colored message with a specific color code
  ColoredLogger.custom('Custom message with color code',
      colorCode: 'magenta',
      prefix: '[CUSTOM] ');

  // Custom colored message with ANSI codes
  ColoredLogger.custom('Custom message with ANSI codes',
      ansiCode: [AnsiCode.bold, AnsiCode.cyan],
      prefix: '[STYLED] ');
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
  String colorCode = 'normal',
  List<String>? ansiCode,
})
```

Parameters:

- `message`: The message to log
- `prefix`: Optional prefix to add before the message (default: empty string)
- `colorCode`: Color name to use (e.g., 'red', 'green', 'blue')
- `ansiCode`: List of ANSI codes to apply (takes precedence over colorCode if provided)

### AnsiCode Class

The `AnsiCode` class provides ANSI escape codes for terminal text styling.

#### Text Styles

- `AnsiCode.normal` - Reset to normal style
- `AnsiCode.bold` - Bold text
- `AnsiCode.dim` - Dimmed text
- `AnsiCode.italic` - Italic text
- `AnsiCode.underline` - Underlined text

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

#### Utility Methods

- `AnsiCode.getColorByCode(String color)` - Returns the ANSI code for a given color name

## Example

See the [example](example/example.dart) for a complete working example.

## Additional Information

- **Repository**: [GitHub](https://github.com/venhdev/colored_logger)
- **Homepage**: [venhdev.me](https://www.venhdev.me)
- **Issues**: Please file issues on the [GitHub repository](https://github.com/venhdev/colored_logger/issues)
- **Contributions**: Contributions are welcome! Feel free to submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
