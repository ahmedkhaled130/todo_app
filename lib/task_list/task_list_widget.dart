import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane:ActionPane(extentRatio: 0.24,motion: ScrollMotion(), children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(17),
          onPressed: (context) {

          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),


      ]) ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Container(
            height:80.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyTheme.whiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VerticalDivider(
                  indent: 10.r,
                  endIndent: 10.r,
                  color: MyTheme.primaryLight,
                  width: 27.w,
                  thickness: 3.w,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(AppLocalizations.of(context)!.title,style: TextStyle(color: MyTheme.primaryLight),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(AppLocalizations.of(context)!.description,style: TextStyle(color: MyTheme.primaryLight),),
                    ),
                  ],
                )),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyTheme.primaryLight,
                  ),
                  child: Icon(Icons.check, color: MyTheme.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
