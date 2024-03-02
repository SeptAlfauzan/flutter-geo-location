import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datasource.dart';
import 'place_of_worship.dart';

class Properties extends Equatable {
  final String? name;
  final String? country;
  final String? countryCode;
  final String? region;
  final String? state;
  final String? county;
  final String? city;
  final String? postcode;
  final String? street;
  final double? lon;
  final double? lat;
  final String? formatted;
  final String? addressLine1;
  final String? addressLine2;
  final List<String>? categories;
  final List<String>? details;
  final Datasource? datasource;
  final PlaceOfWorship? placeOfWorship;
  final String? placeId;

  const Properties({
    this.name,
    this.country,
    this.countryCode,
    this.region,
    this.state,
    this.county,
    this.city,
    this.postcode,
    this.street,
    this.lon,
    this.lat,
    this.formatted,
    this.addressLine1,
    this.addressLine2,
    this.categories,
    this.details,
    this.datasource,
    this.placeOfWorship,
    this.placeId,
  });

  factory Properties.fromMap(Map<String, dynamic> data) => Properties(
        name: data['name'] as String?,
        country: data['country'] as String?,
        countryCode: data['country_code'] as String?,
        region: data['region'] as String?,
        state: data['state'] as String?,
        county: data['county'] as String?,
        city: data['city'] as String?,
        postcode: data['postcode'] as String?,
        street: data['street'] as String?,
        lon: (data['lon'] as num?)?.toDouble(),
        lat: (data['lat'] as num?)?.toDouble(),
        formatted: data['formatted'] as String?,
        addressLine1: data['address_line1'] as String?,
        addressLine2: data['address_line2'] as String?,
        categories: data['categories'] as List<String>?,
        details: data['details'] as List<String>?,
        datasource: data['datasource'] == null
            ? null
            : Datasource.fromMap(data['datasource'] as Map<String, dynamic>),
        placeOfWorship: data['place_of_worship'] == null
            ? null
            : PlaceOfWorship.fromMap(
                data['place_of_worship'] as Map<String, dynamic>),
        placeId: data['place_id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'country': country,
        'country_code': countryCode,
        'region': region,
        'state': state,
        'county': county,
        'city': city,
        'postcode': postcode,
        'street': street,
        'lon': lon,
        'lat': lat,
        'formatted': formatted,
        'address_line1': addressLine1,
        'address_line2': addressLine2,
        'categories': categories,
        'details': details,
        'datasource': datasource?.toMap(),
        'place_of_worship': placeOfWorship?.toMap(),
        'place_id': placeId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Properties].
  factory Properties.fromJson(String data) {
    return Properties.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Properties] to a JSON string.
  String toJson() => json.encode(toMap());

  Properties copyWith({
    String? name,
    String? country,
    String? countryCode,
    String? region,
    String? state,
    String? county,
    String? city,
    String? postcode,
    String? street,
    double? lon,
    double? lat,
    String? formatted,
    String? addressLine1,
    String? addressLine2,
    List<String>? categories,
    List<String>? details,
    Datasource? datasource,
    PlaceOfWorship? placeOfWorship,
    String? placeId,
  }) {
    return Properties(
      name: name ?? this.name,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      region: region ?? this.region,
      state: state ?? this.state,
      county: county ?? this.county,
      city: city ?? this.city,
      postcode: postcode ?? this.postcode,
      street: street ?? this.street,
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
      formatted: formatted ?? this.formatted,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      categories: categories ?? this.categories,
      details: details ?? this.details,
      datasource: datasource ?? this.datasource,
      placeOfWorship: placeOfWorship ?? this.placeOfWorship,
      placeId: placeId ?? this.placeId,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      country,
      countryCode,
      region,
      state,
      county,
      city,
      postcode,
      street,
      lon,
      lat,
      formatted,
      addressLine1,
      addressLine2,
      categories,
      details,
      datasource,
      placeOfWorship,
      placeId,
    ];
  }
}
