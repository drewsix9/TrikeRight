import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/features/history/data/history_list_provider.dart';
import 'package:trikeright/features/history/presentation/widget/my_list_view_builder.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Future<void> showDeleteDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          title: const Text('Delete History'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You are about to delete all history.'),
                Text('Are you sure you want to proceed?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Provider.of<HistoryListProvider>(context, listen: false)
                    .deleteHistoryList();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      // AppBar - Trike Right
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'History',
          textAlign: TextAlign.center,
          style: AppTextLightTheme.trikeRightAppBarTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDeleteDialog();
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      // Sliding Up Panel
      body: const MyListViewBuilder(),
      // Bottom Navigation Bar
    );
  }
}
