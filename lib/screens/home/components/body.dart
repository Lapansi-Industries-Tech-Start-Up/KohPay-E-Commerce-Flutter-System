import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'BalanceBanner.dart';
import 'home_header.dart';
import 'SliderOffer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            BalanceBanner(),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            SliderOffer(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
