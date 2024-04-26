import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/history/data/history_item.dart';

class HistoryListProvider extends ChangeNotifier {
  static const String _boxName = 'historyListBox';
  List<HistoryItem> _historyList = [];
  List<HistoryItem> get historyList => _historyList;
  HistoryItem? _activeHistoryItem;

  void getHistoryList() async {
    var box = await Hive.openBox<HistoryItem>(_boxName);
    _historyList = box.values.toList();
    notifyListeners();
    Log.i('Got history list: $_historyList');
  }

  HistoryItem getHistoryItem(int index) {
    return _historyList[index];
  }

  void addHistoryItem(HistoryItem historyItem) async {
    var box = await Hive.openBox<HistoryItem>(_boxName);
    await box.add(historyItem);
    getHistoryList();
    Log.i("Added history item: $historyItem");
  }

  void deleteHistoryItem(int index) async {
    var box = await Hive.openBox<HistoryItem>(_boxName);
    await box.deleteAt(index);
    getHistoryList();
    Log.i("Deleted history item at index: $index");
  }

  void deleteHistoryList() async {
    var box = await Hive.openBox<HistoryItem>(_boxName);
    await box.clear();
    getHistoryList();
    Log.i("Deleted all history items");
  }
}
