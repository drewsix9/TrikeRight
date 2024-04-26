import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/features/history/data/history_item.dart';

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({super.key});

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
