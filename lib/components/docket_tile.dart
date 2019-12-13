import 'package:flutter/material.dart';

import 'docket_checkbox.dart';

class DocketTile extends StatelessWidget {
  const DocketTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('My First Docket'),
      trailing: new DocketCheckbox(),
    );
  }
}
