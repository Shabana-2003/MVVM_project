import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:bw_one/view/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:bw_one/model/user_model.dart';

class UserListItem extends StatelessWidget {
  final User user;
  final VoidCallback onTrailingPressed;
  final VoidCallback onTap;

  const UserListItem({
    required this.user,
    required this.onTrailingPressed,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: greyy,
          backgroundImage: NetworkImage(user.picture['thumbnail'] ?? ''),
        ),
        title: Text(
          user.name,
          style: paymentTextStyle,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward,
            color: otheryellow,
          ),
          onPressed: onTrailingPressed,
        ),
        onTap: onTap,
      ),
    );
  }
}
