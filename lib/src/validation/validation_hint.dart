const List<ValidationHint> validationErrors = [
  ValidationHint.featureCollectionMustHaveFeatures,
  ValidationHint.featureCollectionFeaturesMustBeAList,
  ValidationHint.featureMustHaveGeometry,
  ValidationHint.featurePropertiesMustBeAnObject,
  ValidationHint.featureIdMustBeStringOrNumber,
  ValidationHint.geometryCollectionGeometriesMustBeAList,
  ValidationHint.geometryMustBeAnObject,
  ValidationHint.geometryMustHaveType,
  ValidationHint.geometryTypeInvalid,
  ValidationHint.geometryMustHaveCoordinates,
  ValidationHint.geometryCoordinatesMustBeAList,
  ValidationHint.bboxMustBeAList,
  ValidationHint.bboxListMustContainOnlyNumbers,
  ValidationHint.bboxMustContain4Or6Elements,
  ValidationHint.multiPointCoordinatesMustBeAListOfLists,
  ValidationHint.lineStringMustHaveMinimum2Positions,
  ValidationHint.polygonCoordinatesMustBeAList,
  ValidationHint.multiPolygonCoordinatesMustBeAList,
  ValidationHint.linearRingMustBeAList,
  ValidationHint.linearRingMustHaveMinimum4Positions,
  ValidationHint.linearRingFirstAndLastPositionMustBeTheSame,
  ValidationHint.positionMustNotBeNull,
  ValidationHint.positionMustBeAnList,
  ValidationHint.positionMustContainAtLeast2Elements,
  ValidationHint.positionMustContainOnlyNumbers,
];

const List<ValidationHint> validationWarnings = [
  ValidationHint.positionRecommendedMaxPrecisionOf6,
  ValidationHint.positionShouldNotContainMoreThan3Elements,
  ValidationHint.linearRingShouldFollowRightHandRule,
  ValidationHint.multiLineStringShouldHaveAtLeast2Items,
  ValidationHint.multiPointShouldHaveAtLeast2Items,
  ValidationHint.multiPolygonShouldHaveAtLease2Items,
  ValidationHint.polygonShouldHaveItems,
  ValidationHint.geometryCollectionGeometriesShouldHaveItems,
  ValidationHint.featureMustHaveProperties,
];

enum ValidationHint {
  featureCollectionMustHaveFeatures,
  featureCollectionFeaturesMustBeAList,

  featureMustHaveGeometry,
  featureMustHaveProperties,
  featurePropertiesMustBeAnObject,
  featureIdMustBeStringOrNumber,

  geometryCollectionGeometriesMustBeAList,
  geometryCollectionGeometriesShouldHaveItems,

  geometryMustBeAnObject,
  geometryMustHaveType,
  geometryTypeInvalid,
  geometryMustHaveCoordinates,
  geometryCoordinatesMustBeAList,

  bboxMustBeAList,
  bboxListMustContainOnlyNumbers,
  bboxMustContain4Or6Elements,

  multiPointCoordinatesMustBeAListOfLists,
  multiPointShouldHaveAtLeast2Items,

  lineStringMustHaveMinimum2Positions,
  multiLineStringShouldHaveAtLeast2Items,

  polygonCoordinatesMustBeAList,
  polygonShouldHaveItems,

  multiPolygonCoordinatesMustBeAList,
  multiPolygonShouldHaveAtLease2Items,

  linearRingMustBeAList,
  linearRingMustHaveMinimum4Positions,
  linearRingFirstAndLastPositionMustBeTheSame,
  linearRingShouldFollowRightHandRule,

  positionMustNotBeNull,
  positionMustBeAnList,
  positionMustContainAtLeast2Elements,
  positionShouldNotContainMoreThan3Elements,
  positionMustContainOnlyNumbers,
  positionRecommendedMaxPrecisionOf6,
}

extension ValidationExtensions on ValidationHint {
  bool get isError => validationErrors.contains(this);
  bool get isWarning => validationWarnings.contains(this);
}

extension ValidationListExtensions on List<ValidationHint> {
  bool get isValidStrict => !hasErrors && !hasWarnings;
  bool get isValid => !hasErrors;

  // Has validation Hints of Error category
  bool get hasErrors => any((hint) => hint.isError);

  // Has validation Hints of Warning category
  bool get hasWarnings => any((hint) => hint.isWarning);

  /// Throws an ArgumentError if there are any validation Errors.
  ///
  void check({bool strict = false}) {
    if (!strict && !isValid) {
      throw Exception('Validation failed: $this');
    } else if (strict && !isValidStrict) {
      throw Exception('Validation failed: $this');
    }
  }
}
