import 'package:flutter/material.dart';

import 'components/body.dart';

class Deposit extends StatelessWidget {
  static String routeName = "/Deposit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deposit"),
      ),
      body: Body(),
    );
  }
}
