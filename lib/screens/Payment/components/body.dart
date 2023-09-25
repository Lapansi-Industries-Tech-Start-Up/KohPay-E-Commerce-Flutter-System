import 'package:flutter/material.dart';

import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/Payment/components/payment_menu.dart';
import 'payment_menu.dart';
//import 'payment_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          //ProfilePic(),
          SizedBox(height: 20),
          PaymentMenu(
            text: "Goods and Services",
            icon: "assets/icons/id.svg",
            press: () => {},
          ),
          PaymentMenu(
            text: "Electricity",
            icon: "assets/icons/bulb.svg",
            press: () {},
          ),
          PaymentMenu(
            text: "TV Services",
            icon: "assets/icons/TV1.svg",
            press: () {},
          ),
          PaymentMenu(
            text: "Insurance",
            icon: "assets/icons/insurance.svg",
            press: () {},
          ),
          PaymentMenu(
            text: "NetFlix",
            icon: "assets/icons/HD.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
