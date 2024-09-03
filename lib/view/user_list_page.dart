import 'package:bw_one/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../view_model/user_store.dart';
import 'payment_page.dart';
import 'visitor_management_page.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
            child: Text(
          'User List',
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () {
              userStore.clearData();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return userStore.users.isEmpty
              ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      userStore.fetchUsers();
                    },
                    child: const Text('Load Users'),
                  ),
                )
              : ListView.builder(
                  itemCount: userStore.users.length,
                  itemBuilder: (context, index) {
                    final user = userStore.users[index];
                    return Card(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
  leading: CircleAvatar(
    backgroundColor: Colors.grey,
    backgroundImage: NetworkImage(user.picture['thumbnail'] ?? ''), // Use thumbnail URL
  ),
  title: Text('${user.name}'),
  
  trailing: IconButton(
    icon: const Icon(Icons.arrow_forward),
    //onPressed: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PaymentPage(user: user),
      //   ),
      // );
      onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PaymentPage(userId: user.id),
    ),
  );
}

   // },
  ),
  onTap: () {
    _showPaymentDialog(context, userStore, user);
  },
                      )

                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VisitorManagementPage()),
            );
          },
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          child: const Icon(
            Icons.person_add,
            color: Colors.white,
          )),
    );
  }

  void _showPaymentDialog(
      BuildContext context, UserStore userStore, User user) {
    String selectedMethod = user.paymentMethod;
    TextEditingController amountController = TextEditingController(
        text: user.paymentAmount.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Payment Details'),
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
                userStore.updatePaymentMethod(user, selectedMethod);
                userStore.updatePaymentAmount(
                    user, double.tryParse(amountController.text) ?? 2500.0);
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
