import 'package:flutter/material.dart';

class DocketCheckbox extends StatelessWidget {
  final bool docketState;
  final Function toggleDocketState;

  DocketCheckbox({this.docketState, this.toggleDocketState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: docketState,
      onChanged: toggleDocketState,
    );
  }
}
