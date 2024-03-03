import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'feature.dart';

class PlacesLocationResponse extends Equatable {
  final String? type;
  final List<Feature>? features;

  const PlacesLocationResponse({this.type, this.features});

  factory PlacesLocationResponse.fromMap(Map<String, dynamic> data) {
    return PlacesLocationResponse(
      type: data['type'] as String?,
      features: (data['features'] as List<dynamic>?)
          ?.map((e) => Feature.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'type': type,
        'features': features?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlacesLocationResponse].
  factory PlacesLocationResponse.fromJson(String data) {
    return PlacesLocationResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlacesLocationResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  PlacesLocationResponse copyWith({
    String? type,
    List<Feature>? features,
  }) {
    return PlacesLocationResponse(
      type: type ?? this.type,
      features: features ?? this.features,
    );
  }

  @override
  List<Object?> get props => [type, features];
}
