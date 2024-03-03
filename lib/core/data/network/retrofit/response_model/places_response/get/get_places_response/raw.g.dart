// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Raw _$RawFromJson(Map<String, dynamic> json) => Raw(
      name: json['name'] as String?,
      osmId: json['osm_id'] as int?,
      amenity: json['amenity'] as String?,
      building: json['building'] as String?,
      osmType: json['osm_type'] as String?,
      religion: json['religion'] as String?,
      addrStreet: json['addr:street'] as String?,
    );

Map<String, dynamic> _$RawToJson(Raw instance) => <String, dynamic>{
      'name': instance.name,
      'osm_id': instance.osmId,
      'amenity': instance.amenity,
      'building': instance.building,
      'osm_type': instance.osmType,
      'religion': instance.religion,
      'addr:street': instance.addrStreet,
    };
