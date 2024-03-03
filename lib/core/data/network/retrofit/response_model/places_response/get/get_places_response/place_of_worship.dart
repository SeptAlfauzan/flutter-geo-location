import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_of_worship.g.dart';

@JsonSerializable()
class PlaceOfWorship {
  final String? religion;

  const PlaceOfWorship({this.religion});

  @override
  String toString() => 'PlaceOfWorship(religion: $religion)';

  factory PlaceOfWorship.fromJson(Map<String, dynamic> json) {
    return _$PlaceOfWorshipFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaceOfWorshipToJson(this);

  PlaceOfWorship copyWith({
    String? religion,
  }) {
    return PlaceOfWorship(
      religion: religion ?? this.religion,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PlaceOfWorship) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => religion.hashCode;
}
