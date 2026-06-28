import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryService {
  static const _key = 'search_history';
  static const _maxItems = 10;

  Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data == null) return [];
    return ((json.decode(data) as List?) ?? [])
        .map((e) => e.toString())
        .toList();
  }

  Future<void> addQuery(String query) async {
    final history = await getHistory();
    history.remove(query);
    history.insert(0, query);
    if (history.length > _maxItems) {
      history.removeRange(_maxItems, history.length);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(history));
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  Future<void> removeQuery(String query) async {
    final history = await getHistory();
    history.remove(query);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(history));
  }
}
