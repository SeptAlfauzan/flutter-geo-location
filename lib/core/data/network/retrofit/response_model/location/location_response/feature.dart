import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'geometry.dart';
import 'properties.dart';

class Feature extends Equatable {
  final String? type;
  final Properties? properties;
  final Geometry? geometry;

  const Feature({this.type, this.properties, this.geometry});

  factory Feature.fromMap(Map<String, dynamic> data) => Feature(
        type: data['type'] as String?,
        properties: data['properties'] == null
            ? null
            : Properties.fromMap(data['properties'] as Map<String, dynamic>),
        geometry: data['geometry'] == null
            ? null
            : Geometry.fromMap(data['geometry'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'properties': properties?.toMap(),
        'geometry': geometry?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Feature].
  factory Feature.fromJson(String data) {
    return Feature.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Feature] to a JSON string.
  String toJson() => json.encode(toMap());

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
  List<Object?> get props => [type, properties, geometry];
}
