// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datasource _$DatasourceFromJson(Map<String, dynamic> json) => Datasource(
      sourcename: json['sourcename'] as String?,
      attribution: json['attribution'] as String?,
      license: json['license'] as String?,
      url: json['url'] as String?,
      raw: json['raw'] == null
          ? null
          : Raw.fromJson(json['raw'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatasourceToJson(Datasource instance) =>
    <String, dynamic>{
      'sourcename': instance.sourcename,
      'attribution': instance.attribution,
      'license': instance.license,
      'url': instance.url,
      'raw': instance.raw,
    };
