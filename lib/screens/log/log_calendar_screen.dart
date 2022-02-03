import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/screens/log/log_show_workout_screen.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';

class LogCalendarScreen extends StatefulWidget {
  const LogCalendarScreen({Key? key}) : super(key: key);

  @override
  State<LogCalendarScreen> createState() => _LogCalendarScreenState();
}

class _LogCalendarScreenState extends State<LogCalendarScreen> {
  final today = DateTime.now();
  List<CalendarEvent> days = [];
  late List<LogDay> logDays;

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    logDays = await context.read<Repository>().wathchAllLogDays();
    for (LogDay item in logDays) {
      days.add(CalendarEvent(
        eventName: item.programsName as String,
        eventDate: DateTime.parse(item.start as String),
        eventBackgroundColor: isApple
            ? CupertinoTheme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        eventID: item.logDaysId.toString(),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cellCalendarPageController = CellCalendarPageController();
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: CellCalendar(
          cellCalendarPageController: cellCalendarPageController,
          events: days,
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
                return MpAlertDialog(
                  title: Text(date.month.monthName + ' ' + date.day.toString()),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: eventsOnTheDate
                        .map(
                          (event) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                mpPageRoute(
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
      ),
    );
  }
}
