import 'bounding_box.dart';
import 'geometry_collection.dart';
import 'line_string.dart';
import 'point.dart';
import 'polygon.dart';
import 'validation_hint.dart';

List<ValidationHint> validateGeometry(dynamic json) {
  final hints = <ValidationHint>[];
  if (json == null) return hints;

  if (json is! Map) {
    hints.add(ValidationHint.geometryMustBeAnObject);
  } else if (!json.containsKey("type")) {
    hints.add(ValidationHint.geometryMustHaveType);
  } else {
    final validators = {
      "Point": validatePoint,
      "MultiPoint": validateMultiPoint,
      "LineString": validateLineString,
      "MultiLineString": validateMultiLineString,
      "Polygon": validatePolygon,
      "MultiPolygon": validateMultiPolygon,
      "GeometryCollection": validateGeometryCollection,
    };
    final type = json["type"];
    if (type == null || type is! String || !validators.containsKey(type)) {
      hints.add(ValidationHint.geometryTypeInvalid);
    } else {
      hints.addAll(validators[type]!(json as Map<String, dynamic>));
    }

    hints.addAll(validateBoundingBox(json['bbox']));
  }
  return hints;
}
