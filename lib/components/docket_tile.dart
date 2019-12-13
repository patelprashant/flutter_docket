import 'package:flutter/material.dart';

import 'docket_checkbox.dart';

class DocketTile extends StatefulWidget {
  @override
  _DocketTileState createState() => _DocketTileState();
}

class _DocketTileState extends State<DocketTile> {
  bool isDocketDone = false;

  void docketStateCallback(newValue) {
    setState(() {
      isDocketDone = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'My First Docket',
        style: TextStyle(
          decoration: isDocketDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: new DocketCheckbox(
          docketState: isDocketDone, toggleDocketState: docketStateCallback),
    );
  }
}
