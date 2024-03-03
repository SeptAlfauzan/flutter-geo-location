// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlacesResponse _$GetPlacesResponseFromJson(Map<String, dynamic> json) =>
    GetPlacesResponse(
      type: json['type'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPlacesResponseToJson(GetPlacesResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features,
    };
