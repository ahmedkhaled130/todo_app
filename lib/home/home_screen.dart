import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/settings/settings.dart';
import 'package:todo_app/task_list/add_task_bottom_sheet.dart';
import 'package:todo_app/task_list/task_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todolist),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        padding: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        height: 47.h,
        notchMargin: 9,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: AppLocalizations.of(context)!.tasklist),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheetModel();
        },
        child: Icon(
          Icons.add,
          color: MyTheme.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: taps[selectedIndex],
    );
  }

  List<Widget> taps = [TaskList(), Settings()];

  void showBottomSheetModel() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddTaskBottomSheet(),
      ),
    );
  }
}
