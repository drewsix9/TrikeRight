import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/features/history/data/history_list_provider.dart';

class MyListViewBuilder extends StatefulWidget {
  const MyListViewBuilder({super.key});

  @override
  State<MyListViewBuilder> createState() => _MyListViewBuilderState();
}

class _MyListViewBuilderState extends State<MyListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryListProvider>(
      builder: (context, value, child) {
        return value.historyList.isEmpty
            ? const Center(
                child: Text('No history items yet'),
              )
            : ListView.builder(
                itemCount: value.historyList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${value.historyList[index].source} to ${value.historyList[index].destination}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFF0C141C),
                        fontSize: 16.sp,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      value.historyList[index].distance > 1000
                          ? '${(value.historyList[index].distance / 1000).toStringAsFixed(2)} km'
                          : '${value.historyList[index].distance} m',
                      style: TextStyle(
                        color: const Color(0xFF49779B),
                        fontSize: 14.sp,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Text(
                      '₱  ${value.historyList[index].total}',
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
      },
    );
  }
}
