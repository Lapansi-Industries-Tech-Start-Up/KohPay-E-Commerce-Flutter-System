import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/Successful/Successful.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class DepositForm extends StatefulWidget {
  @override
  _DepositFormState createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositForm> {
  final _formKey = GlobalKey<FormState>();
  double? amount; // Change data type to double for the money amount
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildAmountFormField(), // Update function call to the modified one
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Deposit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, Successful.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 5, // Set maximum length to 5 digits
      onSaved: (newValue) => amount = double.tryParse(newValue!),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
          if (value.length > 5) {
            // Truncate the input to 5 digits if it's longer
            value = value.substring(0, 5);
            // Update the text field with the truncated value
            // This prevents the user from entering more than 5 digits
            // Set the cursor at the end of the text field
            (context as Element).markNeedsBuild();
          }
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
          addError(error: kPINShortError);
          return "";
        } else if (value!.length < 5) {
          addError(error: kPINShortError);
        } else
          return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildAmountFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => amount = double.tryParse(newValue!),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAmountNullError);
        } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
          addError(error: kInvalidAmountError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPINNullError);
          return "";
        } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
          addError(error: kInvalidAmountError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Amount",
        hintText: "Enter Amount to Deposit",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Cash.svg"),
      ),
    );
  }
}
