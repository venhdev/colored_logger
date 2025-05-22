# Colored Logger

A simple yet powerful colored logging utility for Dart and Flutter applications that enhances console output with ANSI colors.

## Features

- **Color-coded log levels**: Easily distinguish between different types of logs (info, success, warning, error)
- **Custom logging**: Create your own colored log messages with custom prefixes
- **ANSI color support**: Includes a variety of ANSI color codes for terminal output
- **Lightweight**: Minimal dependencies, just import and use
- **Easy to use**: Simple static methods for quick implementation

## Getting started

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

```dart
import 'package:colored_logger/colored_logger.dart';

void main() {
  // Basic usage with predefined log levels
  ColoredLogger.info('This is an info message');
  ColoredLogger.success('Operation completed successfully');
  ColoredLogger.warning('This is a warning message');
  ColoredLogger.error('An error occurred');
  
  // Custom colored message
  ColoredLogger.custom('Custom message', AnsiColor.magenta, prefix: '[CUSTOM] ');
  
  // Available colors
  // AnsiColor.red
  // AnsiColor.green
  // AnsiColor.yellow
  // AnsiColor.blue
  // AnsiColor.magenta
  // AnsiColor.cyan
  // AnsiColor.white
  // AnsiColor.bold
}
```

## Additional information

- **Repository**: [GitHub](https://github.com/venhdev/colored_logger)
- **Homepage**: [venhdev.me](https://www.venhdev.me)
- **Issues**: Please file issues on the [GitHub repository](https://github.com/venhdev/colored_logger/issues)
- **Contributions**: Contributions are welcome! Feel free to submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
