import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../view_model/user_store.dart';

class VisitorManagementPage extends StatelessWidget {
  const VisitorManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Visitor Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: userStore.visitors.isEmpty
                    ? const Center(
                        child: Text('No visitors added yet.'),
                      )
                    : ListView.builder(
                        itemCount: userStore.visitors.length,
                        itemBuilder: (context, index) {
                          final visitor = userStore.visitors[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: ListTile(
                              title: Text(visitor.name),
                              subtitle: Text(
                                  'Method: ${visitor.paymentMethod}\nAmount: ${visitor.paymentAmount.toStringAsFixed(2)}'), // Displaying both payment method and amount
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _showVisitorPaymentDialog(
                                      context, userStore, index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
              ElevatedButton(
                onPressed: () {
                  userStore.addVisitor();
                },
                child: const Text('Add Visitor'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showVisitorPaymentDialog(
      BuildContext context, UserStore userStore, int index) {
    final visitor = userStore.visitors[index];
    String selectedMethod = visitor.paymentMethod;
    TextEditingController amountController = TextEditingController(
        text: visitor.paymentAmount.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Visitor Payment Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: selectedMethod,
                onChanged: (value) {
                  selectedMethod = value!;
                },
                items: ['Cash', 'UPI'].map((method) {
                  return DropdownMenuItem(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Payment Amount',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Update payment method and amount
                userStore.updateVisitorPaymentMethod(index, selectedMethod);
                userStore.updateVisitorPaymentAmount(
                    index, double.tryParse(amountController.text) ?? 1000.0);
                Navigator.pop(context);
              },
              child: const Text('Save', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
