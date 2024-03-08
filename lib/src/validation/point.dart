import 'positions.dart';
import 'validation_hint.dart';

/// { "type": "Point",
///    "coordinates": [30, 10]
/// }
List<ValidationHint> validatePoint(Map<String, dynamic> json) {
  final hints = <ValidationHint>[];
  if (json["type"] != "Point") {
    hints.add(ValidationHint.geometryTypeInvalid);
  } else if (json.containsKey('coordinates') == false) {
    hints.add(ValidationHint.geometryMustHaveCoordinates);
  } else {
    final position = json['coordinates'];
    // ToDo: check type!
    hints.addAll(validatePosition(position));
  }
  return hints;
}

/// {
///    "type": "MultiPoint",
///    "coordinates": [
///        [10, 40], [40, 30], [20, 20], [30, 10]
///    ]
/// }
List<ValidationHint> validateMultiPoint(Map<String, dynamic> json) {
  final hints = <ValidationHint>[];
  if (json["type"] != "MultiPoint") {
    hints.add(ValidationHint.geometryTypeInvalid);
  } else if (json.containsKey('coordinates') == false) {
    hints.add(ValidationHint.geometryMustHaveCoordinates);
  } else {
    final coordinates = json['coordinates'];
    if (coordinates == null || coordinates is! List) {
      hints.add(ValidationHint.geometryCoordinatesMustBeAList);
    } else {
      if (coordinates.length < 2) {
        hints.add(ValidationHint.multiPointShouldHaveAtLeast2Items);
      }

      for (final position in coordinates) {
        hints.addAll(validatePosition(position));
      }
    }
  }
  return hints;
}
