import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            pro.changeLanguage("en");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: pro.languageCode == "en"
                    ? Text(
                        "English",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: MyTheme.primaryLight),
                      )
                    : Text(
                        "English",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: MyTheme.blackColor),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: pro.languageCode=="en"
                    ? Icon(
                        Icons.done,
                        color: MyTheme.primaryLight,
                        size: 30.sp,
                      )
                    : SizedBox.shrink(),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            pro.changeLanguage("ar");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: pro.languageCode=="en"
                    ? Text("Arabic",
                        style: Theme.of(context).textTheme.bodyLarge)
                    : Text(
                        "Arabic",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: MyTheme.primaryLight),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: pro.languageCode == "en"
                    ? SizedBox.shrink()
                    : Icon(
                        Icons.done,
                        color: MyTheme.primaryLight,
                        size: 30.sp,
                      ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
