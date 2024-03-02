import 'dart:convert';

import 'package:equatable/equatable.dart';

class Geometry extends Equatable {
  final String? type;
  final List<double>? coordinates;

  const Geometry({this.type, this.coordinates});

  factory Geometry.fromMap(Map<String, dynamic> data) => Geometry(
        type: data['type'] as String?,
        coordinates: data['coordinates'] as List<double>?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'coordinates': coordinates,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Geometry].
  factory Geometry.fromJson(String data) {
    return Geometry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Geometry] to a JSON string.
  String toJson() => json.encode(toMap());

  Geometry copyWith({
    String? type,
    List<double>? coordinates,
  }) {
    return Geometry(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  @override
  List<Object?> get props => [type, coordinates];
}
