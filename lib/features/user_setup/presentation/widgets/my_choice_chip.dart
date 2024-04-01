import 'package:flutter/material.dart';

class MyChoiceChip extends StatefulWidget {
  final bool isType;
  final String typeName;

  const MyChoiceChip({
    super.key,
    required this.isType,
    required this.typeName,
  });

  @override
  State<MyChoiceChip> createState() => _MyChoiceChipState();
}

class _MyChoiceChipState extends State<MyChoiceChip> {
  set isType(bool selected) {}

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      autofocus: true,
      label: Text(
        widget.typeName,
        style: const TextStyle(
          color: Color(0xFF0C141C),
          fontSize: 14,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: widget.isType,
      onSelected: (selected) {
        setState(() {
          isType = selected;
        });
      },
      // selectedColor: const Color(0xFFE8EDF4),
      backgroundColor: const Color(0xFFE8EDF4),
    );
  }
}
