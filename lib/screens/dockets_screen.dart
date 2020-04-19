import 'package:flutter/material.dart';
import 'package:flutter_docket/model/database.dart';
import 'package:provider/provider.dart';

import '../components/dockets_list.dart';
import 'add_docket_screen.dart';

class DocketsScreen extends StatefulWidget {
  @override
  _DocketsScreenState createState() => _DocketsScreenState();
}

class _DocketsScreenState extends State<DocketsScreen> {
  @override
  Widget build(BuildContext context) {
    final dbDao = Provider.of<DbDocketsDao>(context);
    return StreamBuilder(
      stream: dbDao.watchAllDbDockets(),
      builder: (context, AsyncSnapshot<List<DbDocket>> snapshot) {
        final docketData = snapshot.data ?? List();
        var totalDockets = docketData.length;
        var totalDoneDockets =
            docketData.where((f) => f.completed == true).length;
        var docketString = totalDockets > 1 ? 'Dockets' : 'Docket';

        return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
            onPressed: () {
              //          debugPrint('Adding a new Task');
              showModalBottomSheet(
                  context: context, builder: (context) => AddDocketScreen());
            },
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 30.0,
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        child: Icon(
                          Icons.list,
                          size: 35.0,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'My Dockets',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '$totalDoneDockets / $totalDockets $docketString Done',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset.zero,
                          blurRadius: 6.0,
                          spreadRadius: 3.0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: new DocketsList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
