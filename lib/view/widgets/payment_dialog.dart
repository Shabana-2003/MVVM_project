import 'package:flutter/material.dart';
import '../../model/user_model.dart';

class PaymentDialog extends StatefulWidget {
  final User user;
  final Function(String, double) onPaymentUpdate;

  const PaymentDialog({super.key, required this.user, required this.onPaymentUpdate});

  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  late String paymentMethod;
  late double paymentAmount;

  @override
  void initState() {
    super.initState();
    paymentMethod = widget.user.paymentMethod;
    paymentAmount = widget.user.paymentAmount;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Payment'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Payment Method'),
            onChanged: (value) => paymentMethod = value,
            controller: TextEditingController(text: paymentMethod),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Payment Amount'),
            keyboardType: TextInputType.number,
            onChanged: (value) => paymentAmount = double.tryParse(value) ?? paymentAmount,
            controller: TextEditingController(text: paymentAmount.toString()),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onPaymentUpdate(paymentMethod, paymentAmount);
            Navigator.of(context).pop();
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
