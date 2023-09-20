import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String local = "en";

  changeLanguage(String langCode) {
    local = langCode;
    notifyListeners();
  }
}
