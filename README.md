# `Iuliia`

> Transliterate Cyrillic → Latin in every possible way

This is a Dart port of the incredible Python library [iuliia](https://github.com/nalgeon/iuliia-py) by [@nalgeon](https://github.com/nalgeon), based on the [Java port](https://github.com/massita99/iuliia-java).

Transliteration means representing Cyrillic characters (often in names, geographic locations, etc.) with Latin letters. It is used for passports, visas, driving licenses, mail delivery, and more.

## Why use `Iuliia`

- [20 transliteration schemas](https://github.com/nalgeon/iuliia) (rule sets), including all main international and Russian standards.
- Correctly implements not only the base mapping, but all the special rules for letter combinations and word endings (AFAIK, Iuliia is the only library which does so).
- Simple API and zero third-party dependencies.s.

## Installation

Add `iuliia` to your `pubspec.yaml`:

```yaml
dependencies:
  iuliia: ^1.0.0
```

Then run:

```shell
dart pub get
```

## Usage

```dart
import 'package:iuliia/iuliia.dart';

void main() {
  // Initialize with a specific schema, e.g., ICAO (Doc 9303).
  final iuliia = Iuliia(Schemas.icaoDoc9303);

  // Transliterate text.
  final result = iuliia.translate(
    'Юлия, съешь ещё этих мягких французских булок из Йошкар-Олы, да выпей алтайского чаю.'
  );
  
  print(result);
  // Outputs: Iuliia, sieesh eshche etikh miagkikh frantsuzskikh bulok iz Ioshkar-Oly, da vypei altaiskogo chaiu
}
```

## Available Schemas

iuliia provides multiple schemas. You can choose from standards like `gost7034`, `gost779`, `icoDoc9303`, `mvd310`, `yandexMap`, `bgnPcgn`, and many others. Check the [Iullia.ru](https://iuliia.ru/) class to see the full list:

```dart
// For example:
Iuliia(Schemas.bgnPcgn).translate('Пример текста');
Iuliia(Schemas.yandexMap).translate('Пример текста');
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you want to change.  
Make sure to add or update tests as appropriate.

## License

This Dart port is distributed under the [MIT License](LICENSE). The same license applies to the original library.
