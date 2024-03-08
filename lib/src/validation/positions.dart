import 'validation_hint.dart';

/// Validates a single Position.
/// The [position] parameter should be an array of 2 or 3 numbers. The first
/// two numbers are longitude and latitude and the optional third element is
/// altitude. Returns a list of [ValidationHint]s, if the return is empty, the
/// validation was successful.
/// Alternative: x,y,z; easing, northing, elevation;
///
/// Example
/// ```dart
/// validatePosition([115, -35]);
/// validatePosition([115, -35, 100]);
/// ```

// ToDo: remove null and List check and use strong type here!
List<ValidationHint> validatePosition(dynamic position) {
  final errors = <ValidationHint>[];

  if (position == null) {
    errors.add(ValidationHint.positionMustNotBeNull);
  } else if (position is! List) {
    errors.add(ValidationHint.positionMustBeAnList);
  } else {
    if (position.length < 2) {
      errors.add(ValidationHint.positionMustContainAtLeast2Elements);
    } else if (position.length > 3) {
      // SHOULD NOT extend positions beyond three elements
      errors.add(ValidationHint.positionShouldNotContainMoreThan3Elements);
    }
    if (!position.every((element) => element is num)) {
      errors.add(ValidationHint.positionMustContainOnlyNumbers);
    } else {
      for (final coordinate in position) {
        final numberString = coordinate.toString();
        if (numberString.contains('.') &&
            numberString.split('.').last.length > 6) {
          errors.add(ValidationHint.positionRecommendedMaxPrecisionOf6);
        }
      }
    }
  }

  return errors;
}
