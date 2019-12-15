import 'package:flutter/material.dart';

class DocketTile extends StatelessWidget {
  final bool isDocketDone;
  final String docketTitle;
  final Function docketCallback;

  DocketTile({this.isDocketDone, this.docketTitle, this.docketCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
