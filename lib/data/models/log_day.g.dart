// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogDay _$$_LogDayFromJson(Map<String, dynamic> json) => _$_LogDay(
      logDaysId: json['logDaysId'] as int?,
      daysId: json['daysId'] as int?,
      start: json['start'] as String?,
      finish: json['finish'] as String?,
      daysName: json['daysName'] as String?,
      programsName: json['programsName'] as String?,
    );

Map<String, dynamic> _$$_LogDayToJson(_$_LogDay instance) => <String, dynamic>{
      'logDaysId': instance.logDaysId,
      'daysId': instance.daysId,
      'start': instance.start,
      'finish': instance.finish,
      'daysName': instance.daysName,
      'programsName': instance.programsName,
    };
