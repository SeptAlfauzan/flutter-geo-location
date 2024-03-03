import 'package:collection/collection.dart';

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  factory Geometry.fromResponse(Map<String, dynamic> json) => Geometry(
        type: json['type'] as String?,
        coordinates: json['coordinates'] as List<double>?,
      );

  Map<String, dynamic> toResponse() => {
        'type': type,
        'coordinates': coordinates,
      };

  Geometry copyWith({
    String? type,
    List<double>? coordinates,
  }) {
    return Geometry(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Geometry) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toResponse(), toResponse());
  }

  @override
  int get hashCode => type.hashCode ^ coordinates.hashCode;
}
