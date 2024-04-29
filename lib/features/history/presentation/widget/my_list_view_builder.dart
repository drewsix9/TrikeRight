import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
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
                      style: AppTextLightTheme.listViewBuilderTitle,
                    ),
                    subtitle: Text(
                      value.historyList[index].distance > 1000
                          ? '${(value.historyList[index].distance / 1000).toStringAsFixed(2)} km'
                          : '${value.historyList[index].distance} m',
                      style: AppTextLightTheme.listViewBuilderSubtitle,
                    ),
                    trailing: Text(
                      '₱  ${value.historyList[index].totalFare}',
                      style: AppTextLightTheme.listViewBuilderTrailing,
                    ),
                  );
                },
              );
      },
    );
  }
}
