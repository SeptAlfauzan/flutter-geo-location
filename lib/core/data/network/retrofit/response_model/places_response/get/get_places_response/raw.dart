import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'raw.g.dart';

@JsonSerializable()
class Raw {
  final String? name;
  @JsonKey(name: 'osm_id')
  final int? osmId;
  final String? amenity;
  final String? building;
  @JsonKey(name: 'osm_type')
  final String? osmType;
  final String? religion;
  @JsonKey(name: 'addr:street')
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

  @override
  String toString() {
    return 'Raw(name: $name, osmId: $osmId, amenity: $amenity, building: $building, osmType: $osmType, religion: $religion, addrStreet: $addrStreet)';
  }

  factory Raw.fromJson(Map<String, dynamic> json) => _$RawFromJson(json);

  Map<String, dynamic> toJson() => _$RawToJson(this);

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
    return mapEquals(other.toJson(), toJson());
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
