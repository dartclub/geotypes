import 'validation_hint.dart';
import 'positions.dart';

/// {
///    "type": "LineString",
///    "coordinates": [
///        [30, 10], [10, 30], [40, 40]
///    ]
/// }
List<ValidationHint> validateLineString(Map<String, dynamic> json) {
  final hints = <ValidationHint>[];

  if (json["type"] != "LineString") {
    hints.add(ValidationHint.geometryTypeInvalid);
  }

  if (json.containsKey('coordinates') == false) {
    hints.add(ValidationHint.geometryMustHaveCoordinates);
  } else {
    hints.addAll(
      _validateLineStringCoordinates(
        json['coordinates'],
      ),
    );
  }

  return hints;
}

///
/// { "type": "MultiLineString",
///    "coordinates": [
///        [[10, 10], [20, 20], [10, 40]],
///        [[40, 40], [30, 30], [40, 20], [30, 10]]
///    ]
/// }

List<ValidationHint> validateMultiLineString(Map<String, dynamic> json) {
  final hints = <ValidationHint>[];

  if (json["type"] != "MultiLineString") {
    hints.add(ValidationHint.geometryTypeInvalid);
  }

  if (json.containsKey('coordinates') == false) {
    hints.add(ValidationHint.geometryMustHaveCoordinates);
  } else {
    final coordinates = json['coordinates'];
    if (coordinates == null || coordinates is! List) {
      hints.add(ValidationHint.geometryCoordinatesMustBeAList);
    } else {
      if (coordinates.length < 2) {
        hints.add(ValidationHint.multiLineStringShouldHaveAtLeast2Items);
      }
      for (final lineString in coordinates) {
        hints.addAll(_validateLineStringCoordinates(lineString));
      }
    }
  }
  return hints;
}

List<ValidationHint> _validateLineStringCoordinates(dynamic coordinates) {
  final hints = <ValidationHint>[];
  if (coordinates == null || coordinates is! List) {
    hints.add(ValidationHint.geometryCoordinatesMustBeAList);
  } else {
    if (coordinates.length < 2) {
      hints.add(ValidationHint.lineStringMustHaveMinimum2Positions);
    }
    for (final position in coordinates) {
      hints.addAll(validatePosition(position));
    }
  }
  return hints;
}
