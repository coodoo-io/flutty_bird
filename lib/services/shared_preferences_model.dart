import 'package:flutter/material.dart';
import 'package:flutty_bird/services/share_preferences.dart';

class SharedPreferencesModel extends ChangeNotifier {
  final SharedPreferencesService sharedPreferencesService;
  SharedPreferencesModel({this.sharedPreferencesService});
}
