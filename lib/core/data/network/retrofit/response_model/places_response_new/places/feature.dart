import 'package:collection/collection.dart';

import 'geometry.dart';
import 'properties.dart';

class Feature {
  String? type;
  Properties? properties;
  Geometry? geometry;

  Feature({this.type, this.properties, this.geometry});

  factory Feature.fromResponse(Map<String, dynamic> json) => Feature(
        type: json['type'] as String?,
        properties: json['properties'] == null
            ? null
            : Properties.fromResponse(
                json['properties'] as Map<String, dynamic>),
        geometry: json['geometry'] == null
            ? null
            : Geometry.fromResponse(json['geometry'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toResponse() => {
        'type': type,
        'properties': properties?.toResponse(),
        'geometry': geometry?.toResponse(),
      };

  Feature copyWith({
    String? type,
    Properties? properties,
    Geometry? geometry,
  }) {
    return Feature(
      type: type ?? this.type,
      properties: properties ?? this.properties,
      geometry: geometry ?? this.geometry,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Feature) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toResponse(), toResponse());
  }

  @override
  int get hashCode => type.hashCode ^ properties.hashCode ^ geometry.hashCode;
}
