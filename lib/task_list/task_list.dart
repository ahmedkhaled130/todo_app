import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/task_list/task_list_widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: MyTheme.blackColor,
          activeDayColor: MyTheme.primaryLight,
          activeBackgroundDayColor: MyTheme.whiteColor,
          dotColor: MyTheme.primaryLight,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(child: ListView.builder(itemBuilder: (context, index) => TaskListWidget(),itemCount: 30,))

      ],
    );
  }
}
