import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languageCode="en";
  bool isEnglish = true;

  void changeLanguage(String langCode){
    languageCode=langCode;
    notifyListeners();
  }
}