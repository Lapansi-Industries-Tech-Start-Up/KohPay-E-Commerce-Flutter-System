import 'package:flutter/material.dart';

import 'components/body.dart';

class Withdraw extends StatelessWidget {
  static String routeName = "/Withdraw";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Withdraw"),
      ),
      body: Body(),
    );
  }
}
