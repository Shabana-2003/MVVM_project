import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isUpdated;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    required this.isUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(imageUrl),
      child: isUpdated
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kgreen, width: 4),
              ),
            )
          : null,
    );
  }
}
