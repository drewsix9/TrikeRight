import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAutoCompleteListTile extends StatelessWidget {
  final String location;
  final VoidCallback onTap;

  const MyAutoCompleteListTile({
    super.key,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          horizontalTitleGap: 8.w,
          onTap: onTap,
        ),
        Divider(
          height: 2.h,
          thickness: 2,
        )
      ],
    );
  }
}
