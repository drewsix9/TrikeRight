import 'package:flutter/material.dart';

class MyDragHandle extends StatelessWidget {
  const MyDragHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 20,
      decoration: const BoxDecoration(color: Color(0xFFF7FAFC)),
      child: Center(
        child: Container(
          width: 36,
          height: 4,
          decoration: ShapeDecoration(
            color: const Color(0xFFD8E0E8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          ),
        ),
      ),
    );
  }
}
