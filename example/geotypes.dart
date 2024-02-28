import 'dart:convert';

import 'package:geotypes/geotypes.dart' as geotypes;

void main(List<String> arguments) {
  final geoJson = '''{
      "type": "GeometryCollection",
      "geometries": [
          {
              "type": "Point",
              "coordinates": [
                  100.0,
                  0.0
              ]
          },
          {
              "type": "LineString",
              "coordinates": [
                  [
                      101.0,
                      0.0
                  ],
                  [
                      102.0,
                      1.0
                  ]
              ]
          }
      ]
  }''';

  final featureCollection =
      geotypes.GeometryCollection.fromJson(jsonDecode(geoJson));
  print(featureCollection);
}
