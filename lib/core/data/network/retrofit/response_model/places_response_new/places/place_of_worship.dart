import 'package:collection/collection.dart';

class PlaceOfWorship {
  String? religion;

  PlaceOfWorship({this.religion});

  factory PlaceOfWorship.fromResponse(Map<String, dynamic> json) {
    return PlaceOfWorship(
      religion: json['religion'] as String?,
    );
  }

  Map<String, dynamic> toResponse() => {
        'religion': religion,
      };

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
    return mapEquals(other.toResponse(), toResponse());
  }

  @override
  int get hashCode => religion.hashCode;
}
