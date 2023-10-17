import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
import '../../../data/repository.dart';
import '../../../generated/l10n.dart';
import '../../widgets/burger_menu.dart';
import 'log_show_workout_screen.dart';

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
        eventBackgroundColor: Theme.of(context).primaryColor,
        eventName: e.daysName as String,
        eventDate: DateTime.parse(e.start as String),
        eventID: e.logDayId.toString(),
        eventTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.background),
      ));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cellCalendarPageController = CellCalendarPageController();
    return Scaffold(
      drawer: const BurgerMenu(),
      appBar: AppBar(title: Text(S.of(context).log)),
      body: CellCalendar(
        todayMarkColor: Theme.of(context).primaryColor,
        todayTextColor: Theme.of(context).colorScheme.background,
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
                                    // logDay: logDays[
                                    //     int.parse(event.eventID ?? '0') - 1]
                                    logDay: logDays.firstWhere((element) =>
                                        element.logDayId ==
                                        (int.parse(event.eventID ?? '0'))),
                                  );
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
                              style:
                                  TextStyle(color: event.eventTextStyle.color),
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
