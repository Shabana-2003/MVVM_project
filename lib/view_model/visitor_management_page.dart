import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/user_view_model.dart';

class VisitorManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Visitor Management'),
      ),
      body: Column(
        children: [
          Expanded(
            child: userViewModel.visitors.isEmpty
                ? Center(
                    child: Text('No visitors added yet.'),
                  )
                : ListView.builder(
                    itemCount: userViewModel.visitors.length,
                    itemBuilder: (context, index) {
                      final visitor = userViewModel.visitors[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(visitor['name'][0]),
                          ),
                          title: Text(visitor['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButton<String>(
                                value: visitor['paymentMethod'],
                                onChanged: (value) {
                                  userViewModel.updateVisitorPaymentMethod(index, value!);
                                },
                                items: ['Cash', 'UPI']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Payment Amount',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  double amount = double.tryParse(value) ?? 1000.0;
                                  userViewModel.updateVisitorPaymentAmount(index, amount);
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
              icon: Icon(Icons.add),
              label: Text('Add Visitor'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
