import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFAB({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor:kyellowcolor,
      child: Icon(
        Icons.person_add,
        color:kBlack,
      ),
    );
  }
}
