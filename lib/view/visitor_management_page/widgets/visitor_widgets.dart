import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:bw_one/view/utils/style/text_style.dart';
import 'package:bw_one/view_model/user_store.dart';
import 'package:flutter/material.dart';

class VisitorCard extends StatelessWidget {
  final int index;
  final UserStore userStore;

  const VisitorCard({
    super.key,
    required this.index,
    required this.userStore,
  });

  @override
  Widget build(BuildContext context) {
    final visitor = userStore.visitors[index];

    return Card(
      color:greycard,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(
          visitor.name,
          style: paymentTextStyle
        ),
        subtitle: Text(
          'Method: ${visitor.paymentMethod}\nAmount: ${visitor.paymentAmount.toStringAsFixed(2)}',
          style: paymentTextStyle
        ),
        trailing: IconButton(
          icon:Icon(
            Icons.edit,
            color: kyellow,
          ),
          onPressed: () {
            _showVisitorPaymentDialog(context, userStore, index);
          },
        ),
      ),
    );
  }

  void _showVisitorPaymentDialog(BuildContext context, UserStore userStore, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return PaymentMethodDialog(index: index, userStore: userStore);
      },
    );
  }
}

class PaymentMethodDialog extends StatefulWidget {
  final int index;
  final UserStore userStore;

  const PaymentMethodDialog({
    super.key,
    required this.index,
    required this.userStore,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodDialogState createState() => _PaymentMethodDialogState();
}

class _PaymentMethodDialogState extends State<PaymentMethodDialog> {
  late String selectedMethod;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    final visitor = widget.userStore.visitors[widget.index];
    selectedMethod = visitor.paymentMethod;
    amountController = TextEditingController(text: visitor.paymentAmount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:kBlack,
      title:Text(
        'Update Visitor Payment Details',
        style: paymentTextStyle
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPaymentOption('Cash'),
          _buildPaymentOption('UPI'),
          TextField(
            controller: amountController,
            decoration: InputDecoration(
              labelText: 'Payment Amount',
              labelStyle: paymentTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kWhite),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:kyellow),
              ),
            ),
            keyboardType: TextInputType.number,
            style: paymentTextStyle,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.userStore.updateVisitorPaymentMethod(widget.index, selectedMethod);
            widget.userStore.updateVisitorPaymentAmount(
              widget.index,
              double.tryParse(amountController.text) ?? 0.0,
            );
            Navigator.pop(context);
          },
          child: Text(
            'Save',
            style: TextStyle(color: kyellow, fontFamily: 'Raleway-Light'),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child:Text(
            'Cancel',
            style: paymentTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String method) {
    return ListTile(
      title: Text(
        method,
        style: paymentTextStyle
      ),
      leading: Radio<String>(
        value: method,
        groupValue: selectedMethod,
        activeColor: kyellow,
        onChanged: (value) {
          setState(() {
            selectedMethod = value!;
          });
        },
      ),
    );
  }
}
