// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Muscle _$$_MuscleFromJson(Map<String, dynamic> json) => _$_Muscle(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icon: const Uint8ListConverter().fromJson(json['icon'] as List<int>?),
    );

Map<String, dynamic> _$$_MuscleToJson(_$_Muscle instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': const Uint8ListConverter().toJson(instance.icon),
    };
