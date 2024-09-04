import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:bw_one/view/utils/style/text_style.dart';
import 'package:flutter/material.dart';

class LoadUsersButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoadUsersButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(kyellowClr),
      ),
      onPressed: onPressed,
      child: Text(
        'Load Users',
        style: blackTextStyle,
      ),
    );
  }
}
