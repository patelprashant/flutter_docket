import 'package:flutter/material.dart';
import 'package:flutter_docket/model/database.dart';
import 'package:flutter_docket/screens/docket_header.dart';
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
        var totalDocketsCount = docketData.length;
        var completedDocketsCount =
            docketData.where((f) => f.completed == true).length;
        var docketPrefixString = totalDocketsCount > 1 ? 'Dockets' : 'Docket';

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
                DocketHeader(
                  completedDocketsCount: completedDocketsCount,
                  totalDocketsCount: totalDocketsCount,
                  docketPrefixString: docketPrefixString,
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
