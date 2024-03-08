import 'validation_hint.dart';

// "bbox": [-10.0, -10.0, 10.0, 10.0],
List<ValidationHint> validateBoundingBox(dynamic bbox) {
  final hints = <ValidationHint>[];
  if (bbox == null) return hints;

  if (bbox is! List) {
    hints.add(ValidationHint.bboxMustBeAList);
    return hints;
  }

  if (!bbox.every((element) => element is num)) {
    hints.add(ValidationHint.bboxListMustContainOnlyNumbers);
    return hints;
  }

  if (bbox.length != 4 && bbox.length != 6) {
    hints.add(ValidationHint.bboxMustContain4Or6Elements);
    return hints;
  }
  return hints;
}
