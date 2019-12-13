import 'package:flutter/material.dart';

class DocketCheckbox extends StatefulWidget {
  @override
  _DocketCheckboxState createState() => _DocketCheckboxState();
}

class _DocketCheckboxState extends State<DocketCheckbox> {
  bool isDocketDone = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isDocketDone,
      onChanged: (bool value) {
        setState(() {
          isDocketDone = value;
        });
      },
    );
  }
}
