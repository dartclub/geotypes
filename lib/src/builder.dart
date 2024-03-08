

/*

Models:
- immutable
- copyWith
- could be invalid

Builder: 
- builds models
- could be on basis of an existing model
- supports valid and invalid structures
- build(normalize: true) Normalizes the output. 
- build() throws an error is the model is invalid
- build(strict: false) does not throw an error and builds invalid models.

Validator: 
- check if models valid
- has interface to throw errors or return errors. 
- should be able to validate all and give a list of errors.
- error should has position of the invalid part of the model. 
- should goJson be pretty to be validated?

Normalizer
- becomes NormalizationStrategy
- has a lot of options to fix certain problems
- e.g. fix the order of the coordinates
- apply right hand rule on linear rings
- optional add ids for features

Turf: 
- operates only on valid models.


Idee: 
  - Models sollten relativ simpel sein.
  - Es gibt einen GeoBuilder, der die Models erzeugen kann. 
  - Der GeoBuilder nutzt als input Map<String, dynamic> 
  - Es können aber verschiedene Builder gebaut werden, die z.B. mit Json-String 
    arbeiten oder dem well-known text format.
  - Point with different representations
  - Problem, propierties kann null sein, aber auch eine leere Liste im Json
    in Dart wäre es ein schöneres Interface, wenn man eine leere Liste hätte. 
    Ich möchte vermeiden, dass das json das dart interface bestimmt.
  - Wäre es valide, wenn die Typen alle immuteable sind? auch die Listen?
    zum verändern kann man einen builder anbieten.
  - Builder könnte invalides geoJson zulassen, aber beim build(strict) wird
    alles vaslidiert, GeoJson Error geworfen oder ggf. die Koordinaten Reihenfolge 
    angepasst, Features mit ids versorgt werden, etc.
  - Das gleiche sollte beim serialisieren (strict) möglich sein.

  https://datatracker.ietf.org/doc/html/rfc7946#ref-GJ2008
  https://en.wikipedia.org/wiki/Projected_coordinate_system
  https://en.wikipedia.org/wiki/Geographic_coordinate_system
  https://en.wikipedia.org/wiki/World_Geodetic_System
  https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry

 */
/*
main() {
  final firstPoint = Point._(1, 2);
  final secondPoint = Point._(1, 2, 3);
  print(firstPoint.latitude);
  print(secondPoint.easting);
  print(secondPoint.x);

  print("first has altitude: ${firstPoint.hasAltitude}");
  print("second has altitude: ${secondPoint.hasElevation}");
}

class GeoFactory {
  static Point createPoint(List<num> data) {
    if (data.length == 2) {
      return Point._(data[0].toDouble(), data[1].toDouble());
    } else if (data.length == 3) {
      return Point._(
          data[0].toDouble(), data[1].toDouble(), data[2].toDouble());
    } else {
      throw ArgumentError('Invalid number of arguments');
    }
  }
}


import 'position.dart';
final position = Position(json);
position.latitude;


import 'position_utm.dart';
final position = Position(json);
position.easing;















// WGS 84
extension Wgs84PointExtension on Point {
  double get longitude => _first;
  double get latitude => _second;
  double? get altitude => _third;
  bool get hasAltitude => _third != null;
}

// Utm easting and northing
extension UtmPointExtension on Position {
  double get easting => _first;
  double get northing => _second;
  double? get elevation => _third;
  bool get hasElevation => _third != null;
}

// Utm easting and northing
extension XyzPointExtension on Position {
  double get x => _first;
  double get y => _second;
  double? get z => _third;
  bool get hasZ => _third != null;
}

class Position {
  final double _first;
  final double _second;
  final double? _third;

  Point._(this._first, this._second, [this._third]);
}

// Feature could be a string or numeric value
class FeatureId {
  final String id;
  FeatureId(this.id);
}

class NothingFeatureId extends FeatureId {
  NothingFeatureId() : super('');
}

extension FeatureIdExtension on FeatureId {
  num? get asNumericId => num.tryParse(id);
  bool get isNumericId => asNumericId != null;
}
*/