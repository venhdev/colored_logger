## 1.2.6

- Deprecate `colorizeText` function in favor of new `colorize` method.
- Deprecate `AnsiCode` and `AnsiColors` classes in favor of `Ansi` class.
- Add new `colorize` method for advanced text styling using `StyledString` and `Ansi`.

## 1.2.5

- Add ability to disable colorization in `ColoredLogger.custom` with `colored` set to false

## 1.2.2

- enhance (info, success, warning, error) methods with predefined color styles (with bold)
- make [ColoredLogger.custom.writer] optional

## 1.2.0

Enhance colored logger with advanced styling and RGB support

- Add support for RGB and 256-color ANSI codes
- Introduce new AnsiColors class with predefined styles
- Remove Flutter dependency making it pure Dart
- Update documentation with new features and examples

## 1.1.0

- Change @param 'colorCode' to 'colorName'
- Make @param chunkSize optional preventing unexpected line breaks, giving more flexibility to the user

## 1.0.2

- Add 'colorizeText' function to colorize text before printing it to console

## 1.0.0

- Fix chunk processing

## 0.0.5

- Long text support

## 0.0.4

- Multiple lines support

## 0.0.3

- using debugPrint instead of print

## 0.0.2

- Add more docs, functions and examples

## 0.0.1

- Initial release
