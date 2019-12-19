import 'package:flutter/material.dart';
import 'package:flutter_docket/model/docekt_data.dart';
import 'package:provider/provider.dart';

import 'docket_tile.dart';

class DocketsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DocketData>(
      builder: (BuildContext context, docketData, Widget child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final currentDocket = docketData.dockets[index];
            return DocketTile(
              docketTitle: currentDocket.name,
              isDocketDone: currentDocket.isDone,
              docketCallback: (docketState) {
                docketData.updateDocket(currentDocket);
              },
            );
          },
          itemCount: docketData.docketCounts,
        );
      },
    );
  }
}
