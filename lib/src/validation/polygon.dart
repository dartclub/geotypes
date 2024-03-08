import 'positions.dart';
import 'validation_hint.dart';

// { "type": "Polygon",
//    "coordinates": [
//        [[30, 10], [40, 40], [20, 40], [10, 20], [30, 10]]
//    ]
//}
//{ "type": "Polygon",
//    "coordinates": [
//        [[35, 10], [45, 45], [15, 40], [10, 20], [35, 10]],
//        [[20, 30], [35, 35], [30, 20], [20, 30]]
//    ]
//}
List<ValidationHint> validatePolygon(Map<String, dynamic> json) {
  final hints = <ValidationHint>[];

  if (json["type"] != "Polygon") {
    hints.add(ValidationHint.geometryTypeInvalid);
  }

  if (json.containsKey('coordinates') == false) {
    hints.add(ValidationHint.geometryMustHaveCoordinates);
  } else {
    final linearRings = json['coordinates'];
    if (linearRings is! List) {
      hints.add(ValidationHint.polygonCoordinatesMustBeAList);
    } else {
      if (linearRings.isEmpty) {
        hints.add(ValidationHint.polygonShouldHaveItems);
      } else {
        hints.addAll(_validateLinearRing(
          linearRings.first,
          shouldBeRightHanded: true,
        ));

        for (final linearRing in linearRings.skip(1)) {
          hints.addAll(_validateLinearRing(
            linearRing,
            shouldBeRightHanded: false,
          ));
        }
      }
    }
  }

  return hints;
}

/// { "type": "MultiPolygon",
///    "coordinates": [
///        [
///            [[30, 20], [45, 40], [10, 40], [30, 20]]
///        ],
///        [
///            [[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]
///        ]
///    ]
/// }
///
/// { "type": "MultiPolygon",
///    "coordinates": [
///        [
///            [[40, 40], [20, 45], [45, 30], [40, 40]]
///        ],
///        [
///            [[20, 35], [10, 30], [10, 10], [30, 5], [45, 20], [20, 35]],
///            [[30, 20], [20, 15], [20, 25], [30, 20]]
///        ]
///    ]
/// }
List<ValidationHint> validateMultiPolygon(Map<String, dynamic> json) {
  final hints = <ValidationHint>[];

  if (json["type"] != "MultiPolygon") {
    hints.add(ValidationHint.geometryTypeInvalid);
  }

  if (json.containsKey('coordinates') == false) {
    hints.add(ValidationHint.geometryMustHaveCoordinates);
  } else {
    final polygons = json['coordinates'];
    if (polygons is! List) {
      hints.add(ValidationHint.multiPolygonCoordinatesMustBeAList);
    } else {
      if (polygons.length < 2) {
        hints.add(ValidationHint.multiPolygonShouldHaveAtLease2Items);
      }
      for (final linearRings in polygons) {
        if (linearRings.isEmpty) {
          hints.add(ValidationHint.polygonShouldHaveItems);
        } else {
          hints.addAll(_validateLinearRing(
            linearRings.first,
            shouldBeRightHanded: true,
          ));

          for (final linearRing in linearRings.skip(1)) {
            hints.addAll(_validateLinearRing(
              linearRing,
              shouldBeRightHanded: false,
            ));
          }
        }
      }
    }
  }

  return hints;
}

// A linear ring is the boundary of a surface or the boundary of a
//    hole in a surface.
// For Polygons with more than one of these rings, the first MUST be
//      the exterior ring, and any others MUST be interior rings.  The
//      exterior ring bounds the surface, and the interior rings (if
//      present) bound holes within the surface.
// [[35, 10], [45, 45], [15, 40], [10, 20], [35, 10]]
List<ValidationHint> _validateLinearRing(dynamic json,
    {required bool shouldBeRightHanded}) {
  final hints = <ValidationHint>[];

  if (json == null || json is! List) {
    hints.add(ValidationHint.linearRingMustBeAList);
  } else {
    if (json.length < 4) {
      hints.add(ValidationHint.linearRingMustHaveMinimum4Positions);
    }
    if (json.length > 2 && _positionsEqual(json.first, json.last)) {
      hints.add(ValidationHint.linearRingFirstAndLastPositionMustBeTheSame);
    }
    for (final position in json) {
      hints.addAll(validatePosition(position));
    }

    if (hints.isEmpty) {
      final isRightHanded = _isRightHanded(json);

      if ((shouldBeRightHanded && !isRightHanded) ||
          (isRightHanded && !shouldBeRightHanded)) {
        hints.add(ValidationHint.linearRingShouldFollowRightHandRule);
      }
    }
  }

  return hints;
}

bool _isRightHanded(dynamic coordinates) {
  if (coordinates.length < 2) {
    throw ArgumentError('coordinates must contain at least 2 elements');
  }

  num sum = 0;
  for (var i = 0; i < coordinates.length - 1; i++) {
    final actual = coordinates[i];
    final next = coordinates[i + 1];
    sum += (next[0] - actual[0]) * (next[1] + actual[1]);
  }
  return sum >= 0;
}

bool _positionsEqual(dynamic first, dynamic second) {
  if (first is List && second is List && first.length == second.length) {
    return false;
  }
  for (var i = 0; i < first.length; i++) {
    if (first[i] != second[i]) {
      return false;
    }
  }
  return true;
}
