import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/features/history/data/history_list_provider.dart';

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var historyList = context.watch<HistoryListProvider>();
    return historyList.historyList.isEmpty
        ? const Center(
            child: Text('No history items yet'),
          )
        : ListView.builder(
            itemCount: historyList.historyList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${historyList.historyList[index].source} to ${historyList.historyList[index].destination}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF0C141C),
                    fontSize: 16.sp,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  historyList.historyList[index].distance > 1000
                      ? '${(historyList.historyList[index].distance / 1000).toStringAsFixed(2)} km'
                      : '${historyList.historyList[index].distance} m',
                  style: TextStyle(
                    color: const Color(0xFF49779B),
                    fontSize: 14.sp,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Text(
                  '₱  ${historyList.historyList[index].total}',
                  style: TextStyle(
                    color: const Color(0xFF0C141C),
                    fontSize: 16.sp,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          );
  }
}
