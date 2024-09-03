import 'package:flutter/material.dart';
import '../../model/visitor_model.dart';

class VisitorCard extends StatelessWidget {
  final Visitor visitor;
  final VoidCallback onTap;

  const VisitorCard({super.key, required this.visitor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(visitor.name),
        subtitle: Text('Payment Method: ${visitor.paymentMethod}\nAmount: \$${visitor.paymentAmount}'),
        onTap: onTap,
      ),
    );
  }
}
