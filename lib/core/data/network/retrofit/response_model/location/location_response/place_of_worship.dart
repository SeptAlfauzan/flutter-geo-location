import 'dart:convert';

import 'package:equatable/equatable.dart';

class PlaceOfWorship extends Equatable {
  final String? religion;

  const PlaceOfWorship({this.religion});

  factory PlaceOfWorship.fromMap(Map<String, dynamic> data) {
    return PlaceOfWorship(
      religion: data['religion'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'religion': religion,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlaceOfWorship].
  factory PlaceOfWorship.fromJson(String data) {
    return PlaceOfWorship.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlaceOfWorship] to a JSON string.
  String toJson() => json.encode(toMap());

  PlaceOfWorship copyWith({
    String? religion,
  }) {
    return PlaceOfWorship(
      religion: religion ?? this.religion,
    );
  }

  @override
  List<Object?> get props => [religion];
}
