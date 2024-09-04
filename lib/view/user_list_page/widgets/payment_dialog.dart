import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:bw_one/view/utils/style/text_style.dart';
import 'package:bw_one/view_model/user_store.dart';
import 'package:flutter/material.dart';
import 'package:bw_one/model/user_model.dart';

class PaymentDialog extends StatefulWidget {
  final User user;
  final UserStore userStore;

  const PaymentDialog({
    required this.user,
    required this.userStore,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  late String selectedMethod;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    selectedMethod = widget.user.paymentMethod;
    amountController =
        TextEditingController(text: widget.user.paymentAmount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBlack,
      title: Text('Update Payment Details', style: paymentTextStyle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRadioOption('Cash'),
            _buildRadioOption('UPI'),
            TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Payment Amount',
                  labelStyle: paymentTextStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kWhite),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kyellowcolor),
                  ),
                ),
                keyboardType: TextInputType.number,
                style: paymentTextStyle),
          ],
        ),
      ),
      actions: _buildDialogActions(context),
    );
  }

  List<Widget> _buildDialogActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          final newAmount = double.tryParse(amountController.text) ??
              widget.user.paymentAmount;
          widget.userStore.updatePaymentAmount(widget.user, newAmount);
          Navigator.pop(context);
        },
        child: Container(
          color: kyellow,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Save amount',
            style: blackTextStyle,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          widget.userStore.updatePaymentMethod(widget.user, selectedMethod);
          Navigator.pop(context);
        },
        child: Container(
          color: kyellow,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text('Save method', style: blackTextStyle),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Container(
          color: kyellow,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Cancel',
            style: blackTextStyle,
          ),
        ),
      ),
    ];
  }

  Widget _buildRadioOption(String method) {
    return ListTile(
      title: Text(method, style: paymentTextStyle),
      leading: Radio<String>(
        value: method,
        groupValue: selectedMethod,
        activeColor: kyellowcolor,
        onChanged: (value) {
          setState(() {
            selectedMethod = value!;
          });
        },
      ),
    );
  }
}
