import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/presentation/screens/log/log_show_workout_screen.dart';
import 'package:npng/theme.dart';
import 'package:provider/provider.dart';

class LogCalendarScreen extends StatefulWidget {
  const LogCalendarScreen({super.key});

  @override
  State<LogCalendarScreen> createState() => _LogCalendarScreenState();
}

class _LogCalendarScreenState extends State<LogCalendarScreen> {
  final today = DateTime.now();
  List<CalendarEvent> days = [];
  late List<LogDay> logDays;

  @override
  void initState() {
    DateTime today = DateTime.now();
    DateTime mounthAgo = today.add(-const Duration(days: 30));
    _refreshOnPageChange(mounthAgo, DateTime.now());
    super.initState();
  }

  void _refreshOnPageChange(DateTime start, DateTime finish) async {
    logDays = await context
        .read<Repository>()
        .findMounthLogDaysBetweenDates(start, finish);
    days.clear();
    for (var e in logDays) {
      days.add(CalendarEvent(
        eventBackgroundColor: AppTheme.light.primaryColor,
        eventName: e.daysName as String,
        eventDate: DateTime.parse(e.start as String),
        eventID: e.logDayId.toString(),
      ));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cellCalendarPageController = CellCalendarPageController();
    return SafeArea(
      child: CellCalendar(
        todayMarkColor: AppTheme.light.primaryColor,
        todayTextColor: AppTheme.dark.primaryColor,
        cellCalendarPageController: cellCalendarPageController,
        events: days,
        onPageChanged: (firstDate, lastDate) {
          _refreshOnPageChange(firstDate, lastDate);
        },
        onCellTapped: (date) {
          final List<CalendarEvent> eventsOnTheDate = days.where((event) {
            final eventDate = event.eventDate;
            return eventDate.year == date.year &&
                eventDate.month == date.month &&
                eventDate.day == date.day;
          }).toList();
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text('${date.month.monthName} ${date.day}'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: eventsOnTheDate
                      .map(
                        (event) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LogWorkoutScreen(
                                      logday: logDays[
                                          int.parse(event.eventID!) - 1]);
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(4),
                            margin: const EdgeInsets.only(bottom: 12),
                            color: event.eventBackgroundColor,
                            child: Text(
                              event.eventName,
                              style: TextStyle(color: event.eventTextColor),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
