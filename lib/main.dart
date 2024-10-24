import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/auth/login/login_screen.dart';
import 'package:todo_app/core/routes.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/provider/my_provider.dart';

import 'auth/register/register_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    return ScreenUtilInit(
        designSize: const Size(360, 690),
      child: MaterialApp.router(
        routerConfig: AppRoutes.routers,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale:  Locale(provider.languageCode),
        debugShowCheckedModeBanner: false,

        theme: MyTheme.lightTheme,
      ),
    );
  }
}
