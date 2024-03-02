import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'feature.dart';

class LocationResponse extends Equatable {
  final String? type;
  final List<Feature>? features;

  const LocationResponse({this.type, this.features});

  factory LocationResponse.fromMap(Map<String, dynamic> data) {
    return LocationResponse(
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
  /// Parses the string and returns the resulting Json object as [LocationResponse].
  factory LocationResponse.fromJson(String data) {
    return LocationResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LocationResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  LocationResponse copyWith({
    String? type,
    List<Feature>? features,
  }) {
    return LocationResponse(
      type: type ?? this.type,
      features: features ?? this.features,
    );
  }

  @override
  List<Object?> get props => [type, features];
}
