import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class StartUpProvider with ChangeNotifier {
  bool _onfirstStart;
  bool _onAuthenticated;

  StartUpProvider() {
    _onfirstStart = false;
    _onAuthenticated = false;
    loadPreferences();
  }

  // getters
  bool get onfirstStart => _onfirstStart;
  bool get onAuthenticated => _onAuthenticated;

  void setOnFirstStart(bool onfirstStart) {
    _onfirstStart = onfirstStart;
    notifyListeners();
    savePreferences();
  }

  void setOnAuthenticated(bool onAuthenticated) {
    _onAuthenticated = onAuthenticated;
    notifyListeners();
    savePreferences();
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onfirstStart = prefs.getBool('onfirstStart');
    bool onAuthenticated = prefs.getBool("onAuthenticated");

    if (onfirstStart != null) setOnFirstStart(onfirstStart);
    if (onAuthenticated != null) setOnAuthenticated(onAuthenticated);
  }

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("onfirstStart", _onfirstStart);
    prefs.setBool("onAuthenicated", _onAuthenticated);
  }
}
