import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'feature.dart';

part 'get_places_response.g.dart';

@JsonSerializable()
class GetPlacesResponse {
  final String? type;
  final List<Feature>? features;

  const GetPlacesResponse({this.type, this.features});

  @override
  String toString() => 'GetPlacesResponse(type: $type, features: $features)';

  factory GetPlacesResponse.fromJson(Map<String, dynamic> json) {
    return _$GetPlacesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPlacesResponseToJson(this);

  GetPlacesResponse copyWith({
    String? type,
    List<Feature>? features,
  }) {
    return GetPlacesResponse(
      type: type ?? this.type,
      features: features ?? this.features,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GetPlacesResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => type.hashCode ^ features.hashCode;
}
