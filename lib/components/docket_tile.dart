import 'package:flutter/material.dart';

class DocketTile extends StatelessWidget {
  final bool isDocketDone;
  final String docketTitle;

  DocketTile({this.isDocketDone, this.docketTitle});

  void docketStateCallback(newValue) {
//    setState(() {
//      isDocketDone = newValue;
//    });
  }

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
//        onChanged: toggleDocketState,
      ),
    );
  }
}
