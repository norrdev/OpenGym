// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayImpl _$$DayImplFromJson(Map<String, dynamic> json) => _$DayImpl(
      id: (json['id'] as num?)?.toInt(),
      ord: (json['ord'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$DayImplToJson(_$DayImpl instance) => <String, dynamic>{
      'id': instance.id,
      'ord': instance.ord,
      'name': instance.name,
      'description': instance.description,
    };
