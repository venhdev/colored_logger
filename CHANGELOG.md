## 2.0.0

- Complete documentation overhaul with clearer, more concise explanations
- New examples demonstrating basic and advanced usage
- Improved test coverage
- Streamlined API documentation
- Removed outdated documentation mechanisms

## 1.2.8

- Enhanced Ansi Class with Fluent Chaining

## 1.2.7

- Introduce new styling mechanism using `Ansi` and `StyledString` for enhanced text customization.
- Remove `AnsiCode` and `AnsiColors` classes and their corresponding files.

## 1.2.6

- Deprecate `colorizeText` function in favor of new `colorize` method.
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

- Fix color codes

## 0.0.3

- Add more colors

## 0.0.2

- Add more colors

## 0.0.1

- Initial version
