import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trikeright/features/trikeright_map/presentation/widgets/my_drag_handle.dart';

class MySlidingUpPanel extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  final TextEditingController sourceController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  void togglePanel() {
    panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
  }

  MySlidingUpPanel({
    super.key,
    required this.controller,
    required this.panelController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Drag handle
        GestureDetector(
          onTap: togglePanel,
          child: const MyDragHandle(),
        ),
      ],
    );
  }
}
