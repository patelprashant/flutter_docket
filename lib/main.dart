import 'package:flutter/material.dart';
import 'package:flutter_docket/model/docekt_data.dart';
import 'package:flutter_docket/screens/dockets_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyDockets());

class MyDockets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DocketData(),
      child: MaterialApp(
        home: DocketsScreen(),
      ),
    );
  }
}
