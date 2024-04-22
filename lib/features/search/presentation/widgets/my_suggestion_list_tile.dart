import 'package:flutter/material.dart';

class MySuggestionListTile extends StatelessWidget {
  final String location;
  final VoidCallback onTap;

  const MySuggestionListTile({
    super.key,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          horizontalTitleGap: 0,
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Divider(
          height: 2,
          thickness: 2,
          color: Colors.grey,
        ),
      ],
    );
  }
}
