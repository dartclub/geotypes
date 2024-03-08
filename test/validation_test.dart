import 'dart:convert';
import 'package:geotypes/validation.dart';
import 'package:test/test.dart';

main() {
  group('lineString validation', () {
    test('valid line', () {
      final json = jsonDecode('''
      {
        "type": "LineString",
        "coordinates": [
          [102.0, 0.0],
          [103.0, 1.0]
        ]
      }
      ''');

      final result = validateGeoJson(json);

      expect(result.hasErrors, false);
      expect(result.hasWarnings, false);
      expect(result.isValid, true);
      expect(result.isValidStrict, true);
    });

    test('valid line', () {
      final json = jsonDecode('''
      {
        "type": "LineString",
        "coordinates": [
          [102.0, 0.0]
        ]
      }
      ''');

      final result = validateGeoJson(json);
      expect(
        result,
        contains(ValidationHint.lineStringMustHaveMinimum2Positions),
      );

      expect(result.hasErrors, true);
      expect(result.hasWarnings, false);
      expect(result.isValid, false);
      expect(result.isValidStrict, false);
    });
  });
}
