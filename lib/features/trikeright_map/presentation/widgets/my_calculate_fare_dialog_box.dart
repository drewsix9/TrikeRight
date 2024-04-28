import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trikeright/core/themes/trikeright_theme.dart';
import 'package:trikeright/features/history/data/history_item.dart';

class CalculateFareDialog extends StatefulWidget {
  final HistoryItem historyItem;
  const CalculateFareDialog({
    super.key,
    required this.historyItem,
  });

  @override
  State<CalculateFareDialog> createState() => _CalculateFareDialogState();
}

class _CalculateFareDialogState extends State<CalculateFareDialog> {
  get historyItem => widget.historyItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(32.0.w, 32.0.h, 32.0.w, 32.0.h),
        child: Hero(
          tag: 'alert-from-hero',
          // createRectTween: (begin, end) {
          //   return CustomRectTween(begin: begin, end: end);
          // },
          child: _buildPopUpDialog(),
        ),
      ),
    );
  }

  Material _buildPopUpDialog() {
    return Material(
      color: const Color(0xFFF7FAFC),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Fare is:',
                            textAlign: TextAlign.center,
                            style: AppTextLightTheme.yourFareIs,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xFF0F1416),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '₱ ${widget.historyItem.total.toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                      style: AppTextLightTheme.totalFare,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
