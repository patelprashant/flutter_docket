import 'package:flutter/material.dart';

class DocketTile extends StatelessWidget {
  final bool isDocketDone;
  final String docketTitle;
  final Function docketCallback;
  final Function longPressCallback;

  DocketTile(
      {this.isDocketDone,
      this.docketTitle,
      this.docketCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        docketTitle,
        style: TextStyle(
          decoration: isDocketDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isDocketDone,
        onChanged: docketCallback,
      ),
    );
  }
}
