import 'package:flutter/material.dart';
import 'package:flutter_docket/components/docket_tile.dart';

class DocketsList extends StatelessWidget {
  const DocketsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DocketTile(),
        DocketTile(),
        DocketTile(),
        DocketTile(),
      ],
    );
  }
}
