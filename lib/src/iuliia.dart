import 'dart:convert';

import 'package:iuliia/iuliia.dart';
import 'package:iuliia/src/latter.dart';
import 'package:iuliia/src/schema_paths.dart';

class Iuliia {
  final Schema schema;

  factory Iuliia(Schemas schema) {
    final raw = schemaPaths[schema.rawName];
    final json = jsonDecode(raw!);

    return Iuliia.raw(
      Schema(
        json['name'] as String,
        json['description'] as String,
        json['url'] as String,
        Map<String, String>.from(json['mapping'] as Map),
        json['prev_mapping'] == null
            ? null
            : Map<String, String>.from(json['prev_mapping'] as Map),
        json['next_mapping'] == null
            ? null
            : Map<String, String>.from(json['next_mapping'] as Map),
        json['ending_mapping'] == null
            ? null
            : Map<String, String>.from(json['ending_mapping'] as Map),
        (json['samples'] as List)
            .map((d) => List<String>.from(d as List))
            .toList(),
      ),
    );
  }

  const Iuliia.raw(this.schema);

  String translate(String input) {
    final words = input.split(' ');
    return words.map((word) => _translateWord(word)).join(' ');
  }

  String _translateWord(String input) {
    final matchedEndingEntry = _getMatchedIndexIfExist(input);

    String inputWithoutMatchedEnding;
    String translatedEnding;

    if (matchedEndingEntry != null) {
      inputWithoutMatchedEnding = input.replaceRange(
        input.length - matchedEndingEntry.key.length,
        null,
        '',
      );

      final ending =
          input.substring(input.length - matchedEndingEntry.key.length);
      final isLowerEnding = ending.toLowerCase() == ending;

      translatedEnding = isLowerEnding
          ? matchedEndingEntry.value
          : matchedEndingEntry.value.toUpperCase();
    } else {
      inputWithoutMatchedEnding = input;
      translatedEnding = '';
    }

    final tokens = _tokenizeWord(inputWithoutMatchedEnding);

    return tokens.map((e) => _translateToken(e)).join() + translatedEnding;
  }

  MapEntry<String, String>? _getMatchedIndexIfExist(String input) {
    final String key = schema.endingMapping?.keys.firstWhere(
          (e) => input.trim().toLowerCase().endsWith(e),
          orElse: () => '',
        ) ??
        '';
    return key != '' ? MapEntry(key, schema.endingMapping![key]!) : null;
  }

  List<Latter> _tokenizeWord(String input) {
    final List<Latter> tokens = [];

    bool isLower = false;
    final lowercase = input.toLowerCase();
    for (int i = 0; i < input.length; i++) {
      isLower = input[i].toLowerCase() == input[i];

      if (input.length == 1) {
        tokens.add(Latter(null, lowercase[i], null, isLower));
      } else if (i == 0) {
        tokens.add(Latter(null, lowercase[i], lowercase[i + 1], isLower));
      } else if (i == input.length - 1) {
        tokens.add(Latter(lowercase[i - 1], lowercase[i], null, isLower));
      } else {
        tokens.add(
          Latter(lowercase[i - 1], lowercase[i], lowercase[i + 1], isLower),
        );
      }
    }

    return tokens;
  }

  String _translateToken(Latter latter) {
    String result;
    final tryPrev =
        schema.prevMapping?[(latter.previous ?? '') + latter.current];
    final tryNext = schema.nextMapping?[latter.current + (latter.next ?? '')];

    if (tryPrev != null) {
      result = tryPrev;
    } else if (tryNext != null) {
      result = tryNext;
    } else {
      result = schema.mapping[latter.current] ?? latter.current;
    }

    return latter.isLower
        ? result
        : result[0].toUpperCase() + result.substring(1);
  }
}
