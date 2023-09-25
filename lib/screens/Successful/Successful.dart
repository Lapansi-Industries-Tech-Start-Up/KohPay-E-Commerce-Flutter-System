import 'package:flutter/material.dart';

import 'components/body.dart';

class Successful extends StatelessWidget {
  static String routeName = "/Successful";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Transaction Success"),
      ),
      body: Body(),
    );
  }
}
