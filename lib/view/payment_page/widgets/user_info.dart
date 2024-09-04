import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:bw_one/view/utils/size/sized_box.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String paymentMethod;
  final double paymentAmount;

  const UserInfo({
    super.key,
    required this.name,
    required this.paymentMethod,
    required this.paymentAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight20,
        Text(
          name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: lightWhite,
            fontFamily: 'Raleway-Light',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Payment Method: $paymentMethod',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Raleway-Light',
            color: lightWhite,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Payment Amount: ₹${paymentAmount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Raleway-Light',
            color: lightWhite,
          ),
        ),
      ],
    );
  }
}
