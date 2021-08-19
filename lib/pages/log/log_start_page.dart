import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/pages/log/log_show_workout.dart';
import 'package:npng/widgets/bottom_bar.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/db.dart';
import 'package:cell_calendar/cell_calendar.dart';

class LogStartPage extends StatefulWidget {
  static String id = '/log';
  const LogStartPage({Key? key}) : super(key: key);

  @override
  _LogStartPageState createState() => _LogStartPageState();
}

class _LogStartPageState extends State<LogStartPage> {
  List<Map<String, dynamic>> _results = [];
  final today = DateTime.now();
  List<CalendarEvent> days = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    //TODO: 1.2 Pagination by mounth
    _results = await db!.rawQuery('''
    select log_days.id AS logDaysId, log_days.days_id AS daysId, start, days.${kLocale}_name AS daysName,
    programs.${kLocale}_name as programsName
    from log_days
    join days on log_days.days_id = days.id 
    join programs on days.programs_id = programs.id
    ORDER BY logDaysId''');
    for (Map<String, dynamic> item in _results) {
      CalendarEvent event = CalendarEvent(
        eventName: '${item['programsName']}: ${item['daysName']}',
        eventDate: DateTime.parse(item['start']),
        eventBackgroundColor: (isApple)
            ? CupertinoTheme.of(context).primaryColor
            : Theme.of(context).accentColor,
        eventID: item['logDaysId'].toString(),
      );
      days.add(event);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cellCalendarPageController = CellCalendarPageController();

    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).log),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Material(
            type: MaterialType.transparency,
            child: CellCalendar(
              cellCalendarPageController: cellCalendarPageController,
              events: days,
              daysOfTheWeekBuilder: (dayIndex) {
                final labels = ["S", "M", "T", "W", "T", "F", "S"];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    labels[dayIndex],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              monthYearLabelBuilder: (datetime) {
                final year = datetime!.year.toString();
                final month = datetime.month.monthName;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Text(
                        "$month  $year",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          cellCalendarPageController.animateToDate(
                            DateTime.now(),
                            curve: Curves.linear,
                            duration: Duration(milliseconds: 300),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              onCellTapped: (date) {
                final eventsOnTheDate = days.where((event) {
                  final eventDate = event.eventDate;

                  return eventDate.year == date.year &&
                      eventDate.month == date.month &&
                      eventDate.day == date.day;
                }).toList();
                showDialog(
                  context: context,
                  builder: (_) {
                    return MpAlertDialog(
                      title: Text(
                          date.month.monthName + " " + date.day.toString()),
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
                                        return LogShowWorkoutPage(
                                          logDayId:
                                              int.parse(event.eventID ?? '-1'),
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(bottom: 12),
                                  color: event.eventBackgroundColor,
                                  child: Text(
                                    event.eventName,
                                    style:
                                        TextStyle(color: event.eventTextColor),
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
              onPageChanged: (firstDate, lastDate) {
                /// Called when the page was changed
                /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 3),
    );
  }
}
