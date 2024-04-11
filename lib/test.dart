import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final focus = FocusNode();

  FormWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              textInputAction: TextInputAction.next,
              autofocus: true,
              decoration: const InputDecoration(labelText: "Input 1"),
              onFieldSubmitted: (v) {
                FocusScope.of(context).requestFocus(focus);
              },
            ),
            TextFormField(
              focusNode: focus,
              decoration: const InputDecoration(labelText: "Input 2"),
            ),
          ],
        ),
      ),
    );
  }
}
