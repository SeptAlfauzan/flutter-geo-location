import 'package:collection/collection.dart';

import 'raw.dart';

class Datasource {
  String? sourcename;
  String? attribution;
  String? license;
  String? url;
  Raw? raw;

  Datasource({
    this.sourcename,
    this.attribution,
    this.license,
    this.url,
    this.raw,
  });

  factory Datasource.fromResponse(Map<String, dynamic> json) => Datasource(
        sourcename: json['sourcename'] as String?,
        attribution: json['attribution'] as String?,
        license: json['license'] as String?,
        url: json['url'] as String?,
        raw: json['raw'] == null
            ? null
            : Raw.fromResponse(json['raw'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toResponse() => {
        'sourcename': sourcename,
        'attribution': attribution,
        'license': license,
        'url': url,
        'raw': raw?.toResponse(),
      };

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
    return mapEquals(other.toResponse(), toResponse());
  }

  @override
  int get hashCode =>
      sourcename.hashCode ^
      attribution.hashCode ^
      license.hashCode ^
      url.hashCode ^
      raw.hashCode;
}
