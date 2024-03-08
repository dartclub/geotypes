// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) {
  validateGeoJson(json).check();
  return Point(
    bbox: json['bbox'] == null
        ? null
        : BBox.fromJson(
            (json['bbox'] as List<dynamic>).map((e) => e as num).toList()),
    coordinates: Position.fromJson(
        (json['coordinates'] as List<dynamic>).map((e) => e as num).toList()),
  );
}

Map<String, dynamic> _$PointToJson(Point instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bbox', instance.bbox?.toJson());
  val['coordinates'] = instance.coordinates.toJson();
  return val;
}

MultiPoint _$MultiPointFromJson(Map<String, dynamic> json) {
  validateGeoJson(json).check();
  return MultiPoint(
    bbox: json['bbox'] == null
        ? null
        : BBox.fromJson(
            (json['bbox'] as List<dynamic>).map((e) => e as num).toList()),
    coordinates: (json['coordinates'] as List<dynamic>?)
            ?.map((e) => Position.fromJson(
                (e as List<dynamic>).map((e) => e as num).toList()))
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$MultiPointToJson(MultiPoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bbox', instance.bbox?.toJson());
  val['coordinates'] = instance.coordinates.map((e) => e.toJson()).toList();
  return val;
}

LineString _$LineStringFromJson(Map<String, dynamic> json) {
  validateGeoJson(json).check();
  return LineString(
    bbox: json['bbox'] == null
        ? null
        : BBox.fromJson(
            (json['bbox'] as List<dynamic>).map((e) => e as num).toList()),
    coordinates: (json['coordinates'] as List<dynamic>?)
            ?.map((e) => Position.fromJson(
                (e as List<dynamic>).map((e) => e as num).toList()))
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$LineStringToJson(LineString instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bbox', instance.bbox?.toJson());
  val['coordinates'] = instance.coordinates.map((e) => e.toJson()).toList();
  return val;
}

MultiLineString _$MultiLineStringFromJson(Map<String, dynamic> json) {
  validateGeoJson(json).check();
  return MultiLineString(
    bbox: json['bbox'] == null
        ? null
        : BBox.fromJson(
            (json['bbox'] as List<dynamic>).map((e) => e as num).toList()),
    coordinates: (json['coordinates'] as List<dynamic>?)
            ?.map((e) => (e as List<dynamic>)
                .map((e) => Position.fromJson(
                    (e as List<dynamic>).map((e) => e as num).toList()))
                .toList())
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$MultiLineStringToJson(MultiLineString instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bbox', instance.bbox?.toJson());
  val['coordinates'] = instance.coordinates
      .map((e) => e.map((e) => e.toJson()).toList())
      .toList();
  return val;
}

Polygon _$PolygonFromJson(Map<String, dynamic> json) {
  validateGeoJson(json).check();
  return Polygon(
    bbox: json['bbox'] == null
        ? null
        : BBox.fromJson(
            (json['bbox'] as List<dynamic>).map((e) => e as num).toList()),
    coordinates: (json['coordinates'] as List<dynamic>?)
            ?.map((e) => (e as List<dynamic>)
                .map((e) => Position.fromJson(
                    (e as List<dynamic>).map((e) => e as num).toList()))
                .toList())
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$PolygonToJson(Polygon instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bbox', instance.bbox?.toJson());
  val['coordinates'] = instance.coordinates
      .map((e) => e.map((e) => e.toJson()).toList())
      .toList();
  return val;
}

MultiPolygon _$MultiPolygonFromJson(Map<String, dynamic> json) {
  validateGeoJson(json).check();
  return MultiPolygon(
    bbox: json['bbox'] == null
        ? null
        : BBox.fromJson(
            (json['bbox'] as List<dynamic>).map((e) => e as num).toList()),
    coordinates: (json['coordinates'] as List<dynamic>?)
            ?.map((e) => (e as List<dynamic>)
                .map((e) => (e as List<dynamic>)
                    .map((e) => Position.fromJson(
                        (e as List<dynamic>).map((e) => e as num).toList()))
                    .toList())
                .toList())
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$MultiPolygonToJson(MultiPolygon instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bbox', instance.bbox?.toJson());
  val['coordinates'] = instance.coordinates
      .map((e) => e.map((e) => e.map((e) => e.toJson()).toList()).toList())
      .toList();
  return val;
}

Map<String, dynamic> _$GeometryCollectionToJson(GeometryCollection instance) {
  final val = <String, dynamic>{
    'type': _$GeoJSONObjectTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bbox', instance.bbox?.toJson());
  val['geometries'] = instance.geometries.map((e) => e.toJson()).toList();
  return val;
}

const _$GeoJSONObjectTypeEnumMap = {
  GeoJSONObjectType.point: 'Point',
  GeoJSONObjectType.multiPoint: 'MultiPoint',
  GeoJSONObjectType.lineString: 'LineString',
  GeoJSONObjectType.multiLineString: 'MultiLineString',
  GeoJSONObjectType.polygon: 'Polygon',
  GeoJSONObjectType.multiPolygon: 'MultiPolygon',
  GeoJSONObjectType.geometryCollection: 'GeometryCollection',
  GeoJSONObjectType.feature: 'Feature',
  GeoJSONObjectType.featureCollection: 'FeatureCollection',
};

/// Returns the key associated with value [source] from [enumValues], if one
/// exists.
///
/// If [unknownValue] is not `null` and [source] is not a value in [enumValues],
/// [unknownValue] is returned. Otherwise, an [ArgumentError] is thrown.
///
/// If [source] is `null`, an [ArgumentError] is thrown.
///
/// Exposed only for code generated by `package:json_serializable`.
/// Not meant to be used directly by user code.
K $enumDecode<K extends Enum, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  for (var entry in enumValues.entries) {
    if (entry.value == source) {
      return entry.key;
    }
  }

  if (unknownValue == null) {
    throw ArgumentError(
      '`$source` is not one of the supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return unknownValue;
}
