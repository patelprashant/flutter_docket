import 'package:flutter/material.dart';
import 'package:flutter_docket/screens/dockets_screen.dart';
import 'package:provider/provider.dart';

import 'model/database.dart';

void main() => runApp(MyDockets());

class MyDockets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appDb = AppDatabase();

    return MultiProvider(
      providers: [
        Provider(
          create: (BuildContext context) => appDb.dbDocketsDao,
        ),
      ],
      child: MaterialApp(
        home: DocketsScreen(),
      ),
    );
  }
}
