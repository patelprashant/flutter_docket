import 'package:flutter/material.dart';
import 'package:flutter_docket/model/database.dart';
import 'package:provider/provider.dart';

import 'docket_tile.dart';

class DocketsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dbDao = Provider.of<DbDocketsDao>(context);

    return StreamBuilder(
        stream: dbDao.watchAllDbDockets(),
        builder: (context, AsyncSnapshot<List<DbDocket>> snapshot) {
          final docketData = snapshot.data ?? List();
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[400],
            ),
            itemCount: docketData.length,
            itemBuilder: (BuildContext context, int index) {
              final currentDocket = docketData[index];
              return DocketTile(
                docketId: currentDocket.id,
                docketTitle: currentDocket.name,
                isDocketDone: currentDocket.completed,
                docketCallback: (docketState) {
                  dbDao.updateDbDocket(
                      currentDocket.copyWith(completed: docketState));
                },
                longPressCallback: () {
                  dbDao.deleteDbDocket(currentDocket);
                },
              );
            },
          );
        });
  }
}
