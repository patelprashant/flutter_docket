import 'package:flutter/material.dart';

class DocketHeader extends StatelessWidget {
  const DocketHeader({
    Key key,
    @required this.completedDocketsCount,
    @required this.totalDocketsCount,
    @required this.docketPrefixString,
  }) : super(key: key);

  final int completedDocketsCount;
  final int totalDocketsCount;
  final String docketPrefixString;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            '$completedDocketsCount / $totalDocketsCount $docketPrefixString Done',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
