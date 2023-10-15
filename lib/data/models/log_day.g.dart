// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogDayImpl _$$LogDayImplFromJson(Map<String, dynamic> json) => _$LogDayImpl(
      logDayId: json['logDayId'] as int?,
      dayId: json['dayId'] as int?,
      start: json['start'] as String?,
      finish: json['finish'] as String?,
      daysName: json['daysName'] as String?,
      programsName: json['programsName'] as String?,
    );

Map<String, dynamic> _$$LogDayImplToJson(_$LogDayImpl instance) =>
    <String, dynamic>{
      'logDayId': instance.logDayId,
      'dayId': instance.dayId,
      'start': instance.start,
      'finish': instance.finish,
      'daysName': instance.daysName,
      'programsName': instance.programsName,
    };
