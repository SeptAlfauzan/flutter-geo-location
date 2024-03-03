import 'package:collection/collection.dart';

class Raw {
  String? name;
  int? osmId;
  String? amenity;
  String? building;
  String? osmType;
  String? religion;
  String? addrStreet;

  Raw({
    this.name,
    this.osmId,
    this.amenity,
    this.building,
    this.osmType,
    this.religion,
    this.addrStreet,
  });

  factory Raw.fromResponse(Map<String, dynamic> json) => Raw(
        name: json['name'] as String?,
        osmId: json['osm_id'] as int?,
        amenity: json['amenity'] as String?,
        building: json['building'] as String?,
        osmType: json['osm_type'] as String?,
        religion: json['religion'] as String?,
        addrStreet: json['addr:street'] as String?,
      );

  Map<String, dynamic> toResponse() => {
        'name': name,
        'osm_id': osmId,
        'amenity': amenity,
        'building': building,
        'osm_type': osmType,
        'religion': religion,
        'addr:street': addrStreet,
      };

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
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Raw) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toResponse(), toResponse());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      osmId.hashCode ^
      amenity.hashCode ^
      building.hashCode ^
      osmType.hashCode ^
      religion.hashCode ^
      addrStreet.hashCode;
}
