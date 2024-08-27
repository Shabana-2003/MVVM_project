import 'package:bw_one/view/visitor_management_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/user_view_model.dart';
import 'payment_page.dart';


class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('User List',style: TextStyle(color: Colors.white),)),
        actions: [
          IconButton(
            icon:const Icon(Icons.clear,color: Colors.white,),
            onPressed: () {
              userViewModel.clearData();
            },
          ),
        ],
      ),
      body: userViewModel.users.isEmpty
          ? Center(
              child: ElevatedButton(
                onPressed: () {
                  userViewModel.fetchUsers();
                },
                child:const Text('Load Users'),
              
              ),
            )
          : ListView.builder(
              itemCount: userViewModel.users.length,
              itemBuilder: (context, index) {
                final user = userViewModel.users[index];
                return Card(
                  margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user['picture']['thumbnail']),
                    ),
                    title: Text('${user['name']['first']} ${user['name']['last']}'),
                    subtitle: Text(user['email']),
                    trailing: IconButton(
                      icon:const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(user: user),
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      _showPaymentDialog(context, userViewModel, user);
                    },
                  ),
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
        child:const Icon(Icons.person_add,color: Colors.white,)
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, UserViewModel userViewModel, dynamic user) {
    String selectedMethod = userViewModel.getPaymentMethod(user);
    TextEditingController amountController =
        TextEditingController(text: userViewModel.getPaymentAmount(user).toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:const Text('Update Payment Details'),
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
                decoration:const InputDecoration(
                  labelText: 'Payment Amount',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                userViewModel.updatePaymentMethod(user, selectedMethod);
                userViewModel.updatePaymentAmount(
                    user, double.tryParse(amountController.text) ?? 2500.0);
                Navigator.pop(context);
              },
              child:const Text('Save',style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:const Text('Cancel',style: TextStyle(color: Colors.black),),
             
            ),
          ],
        );
      },
    );
  }
}
