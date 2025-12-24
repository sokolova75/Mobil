import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/day_steps.dart';

class StepsStorage {
  static const key = 'days';

  static Future<List<DaySteps>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) return [];
    final list = jsonDecode(jsonString) as List;
    return list.map((e) => DaySteps.fromJson(e)).toList();
  }

  static Future<void> save(List<DaySteps> model) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        jsonEncode(model.map((e) => e.toJson()).toList());
    await prefs.setString(key, jsonString);
  }
}