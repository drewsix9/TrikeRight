import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/history/data/history_item.dart';

class HistoryListProvider extends ChangeNotifier {
  static const String _boxName = 'historyListBox';
  List<HistoryItem> _historyList = [];
  List<HistoryItem> get historyList => _historyList;
  Box<HistoryItem> refBox = Hive.box(_boxName);

  HistoryListProvider() {
    getHistoryList();
  }

  Future<void> getHistoryList() async {
    _historyList = refBox.values.toList();
    notifyListeners();
    Log.i('Got history list:\n$_historyList');
  }

  HistoryItem getHistoryItem(int index) {
    return _historyList[index];
  }

  Future<void> addHistoryItem(HistoryItem historyItem) async {
    await refBox.add(historyItem);
    await getHistoryList();
    Log.i("Added history item:\n$historyItem");
  }

  Future<void> deleteHistoryItem(int index) async {
    await refBox.deleteAt(index);
    await getHistoryList();
    Log.i("Deleted history item at index: $index");
  }

  Future<void> deleteHistoryList() async {
    await refBox.clear();
    await getHistoryList();
    Log.i("Deleted all history items");
  }

  @override
  Future<void> dispose() async {
    Log.i('HistoryListProvider disposed');
    await refBox.close();
    super.dispose();
  }
}
