import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datasource.dart';
import 'place_of_worship.dart';

part 'properties.g.dart';

@JsonSerializable()
class Properties {
  final String? name;
  final String? country;
  @JsonKey(name: 'country_code')
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
  @JsonKey(name: 'address_line1')
  final String? addressLine1;
  @JsonKey(name: 'address_line2')
  final String? addressLine2;
  final List<String>? categories;
  final List<String>? details;
  final Datasource? datasource;
  @JsonKey(name: 'place_of_worship')
  final PlaceOfWorship? placeOfWorship;
  @JsonKey(name: 'place_id')
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

  @override
  String toString() {
    return 'Properties(name: $name, country: $country, countryCode: $countryCode, region: $region, state: $state, county: $county, city: $city, postcode: $postcode, street: $street, lon: $lon, lat: $lat, formatted: $formatted, addressLine1: $addressLine1, addressLine2: $addressLine2, categories: $categories, details: $details, datasource: $datasource, placeOfWorship: $placeOfWorship, placeId: $placeId)';
  }

  factory Properties.fromJson(Map<String, dynamic> json) {
    return _$PropertiesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PropertiesToJson(this);

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
    return mapEquals(other.toJson(), toJson());
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
