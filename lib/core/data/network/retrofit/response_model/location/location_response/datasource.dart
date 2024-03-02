import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'raw.dart';

class Datasource extends Equatable {
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

  factory Datasource.fromMap(Map<String, dynamic> data) => Datasource(
        sourcename: data['sourcename'] as String?,
        attribution: data['attribution'] as String?,
        license: data['license'] as String?,
        url: data['url'] as String?,
        raw: data['raw'] == null
            ? null
            : Raw.fromMap(data['raw'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'sourcename': sourcename,
        'attribution': attribution,
        'license': license,
        'url': url,
        'raw': raw?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datasource].
  factory Datasource.fromJson(String data) {
    return Datasource.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datasource] to a JSON string.
  String toJson() => json.encode(toMap());

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
  List<Object?> get props => [sourcename, attribution, license, url, raw];
}
