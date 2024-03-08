# GeoTypes
A lightweight GeoJson library for dart and Flutter.

This library provides a simple and efficient way to work with GeoJson data in Dart and Flutter. It is designed to be easy to use, and to provide a clean and consistent API for working with geospatial data. Therefore we intentionally maintains a limited scope, enabling GeoTypes to serve as a foundational element for a wide range of geospatial applications.

To leverage advanced geospatial analysis features, explore [turf.dart](https://github.com/dartclub/turf_dart), a Dart adaptation of the widely-used [turf.js](https://github.com/Turfjs/turf) library.

## Features
- Fully [RFC 7946](https://tools.ietf.org/html/rfc7946) compliant.
- Geometry types (Point, LineString, Polygon, MultiPoint, MultiLineString, MultiPolygon)
- Geometry containers (GeometryCollection, FeatureCollection, Feature)
- GeoJson data parsing

## Planned 
- Improve documentation
- Support [nested GeometryCollections](https://datatracker.ietf.org/doc/html/rfc7946#section-3.1.8)
- Separation of serialization/deserialization from object representation