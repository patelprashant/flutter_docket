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
            return DocketTile(
              docketTitle: docketData.dockets[index].name,
              isDocketDone: docketData.dockets[index].isDone,
              docketCallback: (docketState) {
//            debugPrint(dockets[index].name);
                // setState(() {
                //   widget.dockets[index].toggleDone();
                // });
              },
            );
          },
          itemCount: docketData.dockets.length,
        );
      },
    );
  }
}
