import 'package:flutter/material.dart';
import 'package:flutter_docket/screens/dockets_screen.dart';

void main() => runApp(MyDockets());

class MyDockets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DocketsScreen(),
    );
  }
}
