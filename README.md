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
import 'package:colored_logger/src/ansi.dart';
import 'package:colored_logger/src/extensions.dart';

void main() {
  // Custom colored message using the new colorize method
  ColoredLogger.colorize(
    'This is a custom message with bold and cyan text.',
    styles: [Ansi.bold, Ansi.cyan],
    prefix: '[STYLED] ',
  );

  // Using extension methods for styling
  ColoredLogger.colorize(
    'This is another custom message with red background and white text.'.bgRed.white,
    prefix: '[HIGHLIGHT] ',
  );

  // Chaining multiple styles
  ColoredLogger.colorize(
    'Chained styles: bold, italic, and green.'.bold.italic.green,
    prefix: '[CHAINED] ',
  );

  // Using 256-color support
  ColoredLogger.colorize(
    '256-color text (index 201)'.fg256(201),
    prefix: '[256-COLOR] ',
  );

  // Using true color (RGB) support
  ColoredLogger.colorize(
    'RGB color text (255, 100, 0)'.fgRgb(255, 100, 0),
    prefix: '[RGB-COLOR] ',
  );
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

#### New `colorize` Method

```dart
ColoredLogger.colorize(
  dynamic message,
  {List<Ansi>? styles, String prefix = ''}
)
```

Parameters:

- `message`: The message to log. Can be a `String` or `StyledString`.
- `styles`: Optional list of `Ansi` styles to apply.
- `prefix`: Optional prefix to add before the message (default: empty string).

This method provides a more flexible and type-safe way to apply ANSI styles using the `Ansi` class and `StyledString` extensions. You can chain styles directly on strings for expressive formatting.

### Ansi Class

The `Ansi` class provides a comprehensive set of ANSI escape codes for terminal text styling, including text formatting, foreground and background colors, 256-color support, and true color (RGB) support.

For a full list of available styles and methods, refer to the `lib/src/ansi.dart` file.

### String Extension Methods

Located in `lib/src/extensions.dart`, these extension methods provide a convenient way to apply `Ansi` styles directly to `String` objects, returning `StyledString` instances. This allows for method chaining to combine multiple styles.

Example:

```dart
'Your text here'.bold.red.bgBlue.underline;
```

### StyledString Class

The `StyledString` class (from `lib/src/extensions.dart`) represents a string with associated `Ansi` styles. It allows for the accumulation and application of multiple styles, and its `toString()` method renders the final ANSI-formatted string.

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



## Example

See the [example](example/example.dart) for a complete working example.

## Additional Information

- **Repository**: [GitHub](https://github.com/venhdev/colored_logger)
- **Homepage**: [venhdev.me](https://www.venhdev.me)
- **Issues**: Please file issues on the [GitHub repository](https://github.com/venhdev/colored_logger/issues)
- **Contributions**: Contributions are welcome! Feel free to submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
