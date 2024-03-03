import 'package:collection/collection.dart';

import 'feature.dart';

class Places {
  String? type;
  List<Feature>? features;

  Places({this.type, this.features});

  factory Places.fromResponse(Map<String, dynamic> json) => Places(
        type: json['type'] as String?,
        features: (json['features'] as List<dynamic>?)
            ?.map((e) => Feature.fromResponse(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toResponse() => {
        'type': type,
        'features': features?.map((e) => e.toResponse()).toList(),
      };

  Places copyWith({
    String? type,
    List<Feature>? features,
  }) {
    return Places(
      type: type ?? this.type,
      features: features ?? this.features,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Places) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toResponse(), toResponse());
  }

  @override
  int get hashCode => type.hashCode ^ features.hashCode;
}
