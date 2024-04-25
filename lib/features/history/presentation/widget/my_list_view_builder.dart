import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/features/history/data/history_item.dart';

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({super.key});

  // final List<HistoryItem> historyList = [
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Panglao Island',
  //     distance: '20 km',
  //     price: '100',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Carmen',
  //     distance: '55 km',
  //     price: '200',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Anda',
  //     distance: '101 km',
  //     price: '300',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Jagna',
  //     distance: '63 km',
  //     price: '250',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Panglao Island',
  //     distance: '20 km',
  //     price: '100',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Carmen',
  //     distance: '55 km',
  //     price: '200',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Anda',
  //     distance: '101 km',
  //     price: '300',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Jagna',
  //     distance: '63 km',
  //     price: '250',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Panglao Island',
  //     distance: '20 km',
  //     price: '100',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Carmen',
  //     distance: '55 km',
  //     price: '200',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Anda',
  //     distance: '101 km',
  //     price: '300',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Jagna',
  //     distance: '63 km',
  //     price: '250',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Panglao Island',
  //     distance: '20 km',
  //     price: '100',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Carmen',
  //     distance: '55 km',
  //     price: '200',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Anda',
  //     distance: '101 km',
  //     price: '300',
  //   ),
  //   HistoryItem(
  //     source: 'Tagbilaran City',
  //     destination: 'Jagna',
  //     distance: '63 km',
  //     price: '250',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            '${historyList[index].source} to ${historyList[index].destination}',
            style: TextStyle(
              color: const Color(0xFF0C141C),
              fontSize: 16.sp,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            'Distance: ${historyList[index].distance}',
            style: TextStyle(
              color: const Color(0xFF49779B),
              fontSize: 14.sp,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            '₱  ${historyList[index].price}',
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
