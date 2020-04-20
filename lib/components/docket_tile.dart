import 'package:flutter/material.dart';

class DocketTile extends StatelessWidget {
  final int docketId;
  final bool isDocketDone;
  final String docketTitle;
  final Function docketCallback;
  final Function longPressCallback;

  DocketTile(
      {this.docketId,
      this.isDocketDone,
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
          color: isDocketDone ? Colors.grey[400] : Colors.black,
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
