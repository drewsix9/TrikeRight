import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/features/history/data/history_item.dart';
import 'package:trikeright/features/history/data/history_item_provider.dart';

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<HistoryItem>> fetchHistoryList() async {
      var historyListProvider =
          Provider.of<HistoryListProvider>(context, listen: false);
      await historyListProvider.getHistoryList();
      return historyListProvider.historyList;
    }

    return FutureBuilder(
        future: fetchHistoryList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<HistoryItem> historyList = snapshot.data!;
            // Now you can use _historyList
            return historyList.isEmpty
                ? const Center(
                    child: Text('No history yet'),
                  )
                : ListView.builder(
                    itemCount: historyList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          '${historyList[index].source} to ${historyList[index].destination}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color(0xFF0C141C),
                            fontSize: 16.sp,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          historyList[index].distance > 1000
                              ? '${(historyList[index].distance / 1000).toStringAsFixed(2)} km'
                              : '${historyList[index].distance} m',
                          style: TextStyle(
                            color: const Color(0xFF49779B),
                            fontSize: 14.sp,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Text(
                          '₱  ${historyList[index].total}',
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
          } else {
            return const Center(
              child: Text('No history yet'),
            );
          }
        });
  }
}
