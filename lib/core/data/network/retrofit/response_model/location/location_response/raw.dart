import 'dart:convert';

import 'package:equatable/equatable.dart';

class Raw extends Equatable {
  final String? name;
  final int? osmId;
  final String? amenity;
  final String? building;
  final String? osmType;
  final String? religion;
  final String? addrStreet;

  const Raw({
    this.name,
    this.osmId,
    this.amenity,
    this.building,
    this.osmType,
    this.religion,
    this.addrStreet,
  });

  factory Raw.fromMap(Map<String, dynamic> data) => Raw(
        name: data['name'] as String?,
        osmId: data['osm_id'] as int?,
        amenity: data['amenity'] as String?,
        building: data['building'] as String?,
        osmType: data['osm_type'] as String?,
        religion: data['religion'] as String?,
        addrStreet: data['addr:street'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'osm_id': osmId,
        'amenity': amenity,
        'building': building,
        'osm_type': osmType,
        'religion': religion,
        'addr:street': addrStreet,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Raw].
  factory Raw.fromJson(String data) {
    return Raw.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Raw] to a JSON string.
  String toJson() => json.encode(toMap());

  Raw copyWith({
    String? name,
    int? osmId,
    String? amenity,
    String? building,
    String? osmType,
    String? religion,
    String? addrStreet,
  }) {
    return Raw(
      name: name ?? this.name,
      osmId: osmId ?? this.osmId,
      amenity: amenity ?? this.amenity,
      building: building ?? this.building,
      osmType: osmType ?? this.osmType,
      religion: religion ?? this.religion,
      addrStreet: addrStreet ?? this.addrStreet,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      osmId,
      amenity,
      building,
      osmType,
      religion,
      addrStreet,
    ];
  }
}
