import 'package:collection/collection.dart';

import 'datasource.dart';
import 'place_of_worship.dart';

class Properties {
  String? name;
  String? country;
  String? countryCode;
  String? region;
  String? state;
  String? county;
  String? city;
  String? postcode;
  String? street;
  double? lon;
  double? lat;
  String? formatted;
  String? addressLine1;
  String? addressLine2;
  List<String>? categories;
  List<String>? details;
  Datasource? datasource;
  PlaceOfWorship? placeOfWorship;
  String? placeId;

  Properties({
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

  factory Properties.fromResponse(Map<String, dynamic> json) => Properties(
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
        categories: json['categories'] as List<String>?,
        details: json['details'] as List<String>?,
        datasource: json['datasource'] == null
            ? null
            : Datasource.fromResponse(
                json['datasource'] as Map<String, dynamic>),
        placeOfWorship: json['place_of_worship'] == null
            ? null
            : PlaceOfWorship.fromResponse(
                json['place_of_worship'] as Map<String, dynamic>),
        placeId: json['place_id'] as String?,
      );

  Map<String, dynamic> toResponse() => {
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
        'datasource': datasource?.toResponse(),
        'place_of_worship': placeOfWorship?.toResponse(),
        'place_id': placeId,
      };

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
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Properties) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toResponse(), toResponse());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      country.hashCode ^
      countryCode.hashCode ^
      region.hashCode ^
      state.hashCode ^
      county.hashCode ^
      city.hashCode ^
      postcode.hashCode ^
      street.hashCode ^
      lon.hashCode ^
      lat.hashCode ^
      formatted.hashCode ^
      addressLine1.hashCode ^
      addressLine2.hashCode ^
      categories.hashCode ^
      details.hashCode ^
      datasource.hashCode ^
      placeOfWorship.hashCode ^
      placeId.hashCode;
}
