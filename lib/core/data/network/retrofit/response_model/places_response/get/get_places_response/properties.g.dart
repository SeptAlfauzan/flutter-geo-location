// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      name: json['name'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
      region: json['region'] as String?,
      state: json['state'] as String?,
      county: json['county'] as String?,
      city: json['city'] as String?,
      postcode: json['postcode'] as String?,
      street: json['street'] as String?,
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      formatted: json['formatted'] as String?,
      addressLine1: json['address_line1'] as String?,
      addressLine2: json['address_line2'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      details:
          (json['details'] as List<dynamic>?)?.map((e) => e as String).toList(),
      datasource: json['datasource'] == null
          ? null
          : Datasource.fromJson(json['datasource'] as Map<String, dynamic>),
      placeOfWorship: json['place_of_worship'] == null
          ? null
          : PlaceOfWorship.fromJson(
              json['place_of_worship'] as Map<String, dynamic>),
      placeId: json['place_id'] as String?,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'country_code': instance.countryCode,
      'region': instance.region,
      'state': instance.state,
      'county': instance.county,
      'city': instance.city,
      'postcode': instance.postcode,
      'street': instance.street,
      'lon': instance.lon,
      'lat': instance.lat,
      'formatted': instance.formatted,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'categories': instance.categories,
      'details': instance.details,
      'datasource': instance.datasource,
      'place_of_worship': instance.placeOfWorship,
      'place_id': instance.placeId,
    };
