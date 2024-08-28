import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/user_view_model.dart';

class VisitorManagementPage extends StatelessWidget {
  const VisitorManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Visitor Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: userViewModel.visitors.isEmpty
                ? const Center(
                    child: Text('No visitors added yet.'),
                  )
                : ListView.builder(
                    itemCount: userViewModel.visitors.length,
                    itemBuilder: (context, index) {
                      final visitor = userViewModel.visitors[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              visitor['name'][8],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(visitor['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButton<String>(
                                value: visitor['paymentMethod'],
                                onChanged: (value) {
                                  userViewModel.updateVisitorPaymentMethod(
                                      index, value!);
                                },
                                items: [
                                  'Cash',
                                  'UPI'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Payment Amount',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  double amount =
                                      double.tryParse(value) ?? 1000.0;
                                  userViewModel.updateVisitorPaymentAmount(
                                      index, amount);
                                },
                                controller: TextEditingController(
                                  text: visitor['paymentAmount'].toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                userViewModel.addVisitor();
              },
              label: const Text(
                'Add Visitor',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
