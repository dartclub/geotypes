import 'geometry.dart';
import 'validation_hint.dart';

///
/// ```json
/// {
///    "type": "GeometryCollection",
///    "geometries": [{
///        "type": "Point",
///        "coordinates": [100.0, 0.0]
///    }, {
///        "type": "LineString",
///        "coordinates": [
///            [101.0, 0.0],
///            [102.0, 1.0]
///        ]
///    }]
/// }
/// ```
List<ValidationHint> validateGeometryCollection(
    Map<String, dynamic> geometryCollection) {
  final hints = <ValidationHint>[];

  if (geometryCollection["type"] != "GeometryCollection") {
    hints.add(ValidationHint.geometryTypeInvalid);
  }

  if (geometryCollection.containsKey('geometries') == false) {
    hints.add(ValidationHint.geometryMustHaveCoordinates);
  } else {
    final geometries = geometryCollection['geometries'];
    if (geometries == null || geometries is! List) {
      hints.add(ValidationHint.geometryCollectionGeometriesMustBeAList);
    } else {
      if (geometries.isEmpty) {
        hints.add(ValidationHint.geometryCollectionGeometriesShouldHaveItems);
      }
      for (final geometry in geometries) {
        hints.addAll(validateGeometry(geometry));
      }
    }
  }
  return hints;
}
