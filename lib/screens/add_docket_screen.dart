import 'package:flutter/material.dart';

class AddDocketScreen extends StatelessWidget {
  final Function addDocketCallback;

  AddDocketScreen(this.addDocketCallback);

  @override
  Widget build(BuildContext context) {
    String newDocketTitle;
    return Container(
      color: Color(0xFF757575),
      padding: EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Docket',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTextValue) {
                newDocketTitle = newTextValue;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                addDocketCallback(newDocketTitle);
              },
            ),
          ],
        ),
      ),
    );
  }
}
