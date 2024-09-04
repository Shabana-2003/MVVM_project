import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:bw_one/view/utils/style/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onClearData;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onClearData,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:appBarColor,
      title: Center(
        child: Text(
          title,
          style: paymentTextStyle,
        ),
      ),
      actions: [
        IconButton(
          icon:Icon(
            Icons.clear,
            color:kWhite,
          ),
          onPressed: onClearData,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
