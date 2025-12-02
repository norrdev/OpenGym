// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoadImpl _$$LoadImplFromJson(Map<String, dynamic> json) => _$LoadImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      preinstalled: (json['preinstalled'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LoadImplToJson(_$LoadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'preinstalled': instance.preinstalled,
    };
