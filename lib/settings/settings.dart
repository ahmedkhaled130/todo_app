import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/settings/language_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'mode_bottom_sheet.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<MyProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 30,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.language),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, right: 25, left: 50),
        child: InkWell(
          onTap: () {
            languageBtmSheet(context);
          },
          child: Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: MyTheme.primaryLight),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(AppLocalizations.of(context)!.english), Icon(Icons.arrow_drop_down)],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 30,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.mode),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, right: 25, left: 50),
            child: InkWell(
              onTap: () {
                modeBtmSheet(context);
              },
              child: Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: MyTheme.primaryLight),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(AppLocalizations.of(context)!.light), Icon(Icons.arrow_drop_down)],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    ]);
  }

  void languageBtmSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void modeBtmSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      builder: (context) => ModeBottomSheet(),
    );
  }
}
