import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'raw.dart';

part 'datasource.g.dart';

@JsonSerializable()
class Datasource {
  final String? sourcename;
  final String? attribution;
  final String? license;
  final String? url;
  final Raw? raw;

  const Datasource({
    this.sourcename,
    this.attribution,
    this.license,
    this.url,
    this.raw,
  });

  @override
  String toString() {
    return 'Datasource(sourcename: $sourcename, attribution: $attribution, license: $license, url: $url, raw: $raw)';
  }

  factory Datasource.fromJson(Map<String, dynamic> json) {
    return _$DatasourceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DatasourceToJson(this);

  Datasource copyWith({
    String? sourcename,
    String? attribution,
    String? license,
    String? url,
    Raw? raw,
  }) {
    return Datasource(
      sourcename: sourcename ?? this.sourcename,
      attribution: attribution ?? this.attribution,
      license: license ?? this.license,
      url: url ?? this.url,
      raw: raw ?? this.raw,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datasource) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      sourcename.hashCode ^
      attribution.hashCode ^
      license.hashCode ^
      url.hashCode ^
      raw.hashCode;
}
