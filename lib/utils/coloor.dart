import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/homepage.dart';

Color setD(int co) {
  if (co == 1) {
    return Colors.amber[100] as Color;
  }
  if (co == 2) {
    return Colors.green[100] as Color;
  }
  if (co == 3) {
    return Colors.lightBlue[100] as Color;
  }
  if (co == 4) {
    return Colors.orange[100] as Color;
  }
  if (co == 5) {
    return Colors.redAccent[100] as Color;
  }
  if (co == 0) {
    return Colors.white;
  }
  return Colors.white;
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
void removeStrings2(int index) async {
  final SharedPreferences prefs = await _prefs;
  currData = prefs.getStringList('data') as List<String>;
  currData.removeAt(index);
  prefs.setStringList('data', currData);
  currData = prefs.getStringList('data') as List<String>;
  currData2 = prefs.getStringList('date2') as List<String>;
  currData2.removeAt(index);
  prefs.setStringList('date2', currData2);
  currData2 = prefs.getStringList('date2') as List<String>;
  currData3 = prefs.getStringList('time') as List<String>;
  currData3.removeAt(index);
  prefs.setStringList('time', currData3);
  currData3 = prefs.getStringList('time') as List<String>;
  currDa = prefs.getStringList('color') as List<String>;
  currDa.removeAt(index);
  prefs.setStringList('color', currDa);
  colorData = currDa.map((i) => int.parse(i)).toList();
}
