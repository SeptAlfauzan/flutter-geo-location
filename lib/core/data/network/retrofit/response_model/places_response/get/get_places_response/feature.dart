import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'geometry.dart';
import 'properties.dart';

part 'feature.g.dart';

@JsonSerializable()
class Feature {
  final String? type;
  final Properties? properties;
  final Geometry? geometry;

  const Feature({this.type, this.properties, this.geometry});

  @override
  String toString() {
    return 'Feature(type: $type, properties: $properties, geometry: $geometry)';
  }

  factory Feature.fromJson(Map<String, dynamic> json) {
    return _$FeatureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FeatureToJson(this);

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
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => type.hashCode ^ properties.hashCode ^ geometry.hashCode;
}
