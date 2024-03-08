import 'validation_hint.dart';
import 'geometry.dart';

///
///```json
/// {
///    "type": "Feature",
///    "geometry": {
///        "type": "Point",
///        "coordinates": [102.0, 0.5]
///    },
///    "properties": {
///        "prop0": "value0"
///    }
/// }
/// ````
List<ValidationHint> validateFeature(Map<String, dynamic> json) {
  final hints = <ValidationHint>[];

  if (json["type"] != "Feature") {
    hints.add(ValidationHint.geometryTypeInvalid);
  }

  if (json.containsKey("geometry") == false) {
    hints.add(ValidationHint.featureMustHaveGeometry);
  } else {
    final geometry = json['geometry'];
    if (geometry != null) {
      hints.addAll(validateGeometry(json['geometry']));
    }
  }

  if (json.containsKey("properties") == false) {
    hints.add(ValidationHint.featureMustHaveProperties);
  } else {
    final properties = json['properties'];
    if (properties != null && properties is! Map) {
      hints.add(ValidationHint.featurePropertiesMustBeAnObject);
    }
  }

  if (json.containsKey("id")) {
    final id = json['id'];
    if (id! is String && id! is num) {
      hints.add(ValidationHint.featureIdMustBeStringOrNumber);
    }
  }

  return hints;
}
