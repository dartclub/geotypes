import 'feature.dart';
import 'validation_hint.dart';

/// ```json
/// {
///     "type": "FeatureCollection",
///     "features": [{
///         "type": "Feature",
///         "geometry": {
///             "type": "Point",
///             "coordinates": [102.0, 0.5]
///         },
///         "properties": {
///             "prop0": "value0"
///         }
///     }, {
///         "type": "Feature",
///         "geometry": {
///             "type": "LineString",
///             "coordinates": [
///                 [102.0, 0.0],
///                 [103.0, 1.0],
///                 [104.0, 0.0],
///                 [105.0, 1.0]
///             ]
///         },
///         "properties": {
///             "prop0": "value0",
///             "prop1": 0.0
///         }
///     }]
/// }
List<ValidationHint> validateFeatureCollection(Map<String, dynamic> json) {
  final hints = <ValidationHint>[];

  if (json["type"] != "FeatureCollection") {
    hints.add(ValidationHint.geometryTypeInvalid);
  }

  if (json.containsKey("features") == false) {
    hints.add(ValidationHint.featureCollectionMustHaveFeatures);
  } else {
    final features = json["features"];
    if (features == null || features is! List) {
      hints.add(ValidationHint.featureCollectionFeaturesMustBeAList);
    } else {
      if (features.isNotEmpty) {
        for (final feature in features) {
          hints.addAll(validateFeature(feature));
        }
      }
    }
  }

  return hints;
}
