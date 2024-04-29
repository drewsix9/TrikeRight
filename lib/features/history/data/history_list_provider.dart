import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:trikeright/core/utils/log.dart';
import 'package:trikeright/features/history/data/history_item.dart';
import 'package:trikeright/features/history/domain/bucket_sort.dart';

class HistoryListProvider extends ChangeNotifier {
  static const String _boxName = 'historyListBox';
  List<HistoryItem> _historyList = [];
  List<HistoryItem> get historyList => _historyList;
  Box<HistoryItem> refBox = Hive.box(_boxName);

  HistoryListProvider() {
    getHistoryList();
  }

  void sortByDateTimeHistoryList() {
    _historyList.sort((a, b) {
      DateTime aDateAndTime = DateTime.parse(a.dateAndTime);
      DateTime bDateAndTime = DateTime.parse(b.dateAndTime);
      Log.i(aDateAndTime);
      Log.i(bDateAndTime);
      return aDateAndTime.compareTo(bDateAndTime);
    });

    Log.i('Sorted By Fare history list:\n$_historyList');
    Fluttertoast.showToast(
        msg: 'Sorted by Date and Time',
        backgroundColor: const Color.fromARGB(255, 234, 237, 239),
        textColor: const Color(0xFF0C141C));

    notifyListeners();
  }

  void bucketSortByFareHistoryList() {
    // Convert _historyList to a list of doubles
    List<double> totals = _historyList.map((item) => item.totalFare).toList();

    // Sort the totals using bucket sort
    BucketSort.bucketSort(totals);

    // Reorder _historyList based on the sorted totals
    _historyList.sort((a, b) =>
        totals.indexOf(a.totalFare).compareTo(totals.indexOf(b.totalFare)));

    Log.i('Sorted By Fare history list:\n$_historyList');
    Fluttertoast.showToast(
        msg: 'Sorted by Fare',
        backgroundColor: const Color.fromARGB(255, 234, 237, 239),
        textColor: const Color(0xFF0C141C));

    // Notify listeners about the change in _historyList
    notifyListeners();
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
