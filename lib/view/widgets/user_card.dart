import 'package:flutter/material.dart';
import '../../model/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserCard({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text('Payment Method: ${user.paymentMethod}\nAmount: \$${user.paymentAmount}'),
        onTap: onTap,
      ),
    );
  }
}
