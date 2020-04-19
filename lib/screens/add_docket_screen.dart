import 'package:flutter/material.dart';
import 'package:flutter_docket/model/database.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:provider/provider.dart';

class AddDocketScreen extends StatefulWidget {
  const AddDocketScreen({
    Key key,
  }) : super(key: key);

  @override
  _AddDocketScreenState createState() => _AddDocketScreenState();
}

class _AddDocketScreenState extends State<AddDocketScreen> {
  TextEditingController controller;
  String newDocketTitle;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildInputUi(context),
        ],
      ),
    );
  }

  _buildInputUi(BuildContext context) {
    final dbDao = Provider.of<DbDocketsDao>(context);
    return Expanded(
      flex: 1,
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
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Task Name'),
              onSubmitted: (newDocketTitle) {
                final newDbDocket = DbDocketsCompanion(
                  name: moor.Value(newDocketTitle),
                );
                dbDao.insertDbDocket(newDbDocket);
                setState(() {
                  newDocketTitle = null;
                  controller.clear();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
