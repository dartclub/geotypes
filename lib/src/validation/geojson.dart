import 'validation_hint.dart';
import 'bounding_box.dart';
import 'feature_collection.dart';
import 'feature.dart';
import 'geometry.dart';

List<ValidationHint> validateGeoJson(dynamic json) {
  final hints = <ValidationHint>[];
  if (json == null) return hints;

  if (json is! Map) {
    hints.add(ValidationHint.geometryMustBeAnObject);
  } else if (!json.containsKey("type")) {
    hints.add(ValidationHint.geometryMustHaveType);
  } else {
    final validators = {
      "Feature": validateFeature,
      "FeatureCollection": validateFeatureCollection,
    };
    final type = json["type"];
    if (type == null || type is! String) {
      hints.add(ValidationHint.geometryTypeInvalid);
    } else if (validators.containsKey(type)) {
      hints.addAll(validators[type]!(json as Map<String, dynamic>));
    } else {
      hints.addAll(validateGeometry(json));
    }

    hints.addAll(validateBoundingBox(json['bbox']));
  }
  return hints;
}
