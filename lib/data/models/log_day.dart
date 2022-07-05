import 'package:equatable/equatable.dart';

/// Day in traning log model.
class LogDay extends Equatable {
  final int? logDaysId;
  final int? daysId;
  final String? start;
  final String? finish;
  final String? daysName;
  final String? programsName;

  const LogDay({
    this.logDaysId,
    this.daysId,
    this.start,
    this.finish,
    this.daysName,
    this.programsName,
  });

  factory LogDay.fromJson(Map<String, dynamic> json) => LogDay(
        logDaysId: json['logDaysId'] as int,
        daysId: json['daysId'] as int,
        start: json['start'] as String,
        finish: json['finish'] as String,
        daysName: json['daysName'] as String,
        programsName: json['programsName'] as String,
      );

  Map<String, dynamic> toJson() => {
        'logDaysId': logDaysId,
        'daysId': daysId,
        'start': start,
        'finish': finish,
        'daysName': daysName,
        'programsName': programsName,
      };

  @override
  List<Object?> get props => [
        logDaysId,
        daysId,
        start,
        finish,
        daysName,
        programsName,
      ];
}
