import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

DateTime selectedDate = DateTime.now();
var formKey = GlobalKey<FormState>();

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(9),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.addnewtask,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.pleaseentertasktitle;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enteryoutaskname,
                      ),
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.pleaseentertaskdescription;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enteryoutaskdescription,
                      ),
                      maxLines: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.selectdate,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        dataSelect();
                      },
                      child: Text(
                        selectedDate.toString().substring(0, 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
          ElevatedButton(
            onPressed: () {
              addTask();
            },
            child: Text(
              "Add",
              style: TextStyle(color: MyTheme.whiteColor),
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(MyTheme.primaryLight),
            ),
          )
        ],
      ),
    );
  }

  void dataSelect() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if(formKey.currentState?.validate()==true);
  }
}
