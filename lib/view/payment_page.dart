// // payment_page.dart
// import 'package:flutter/material.dart';
// import '../model/user_model.dart';

// class PaymentPage extends StatelessWidget {
//   final User user;

//   const PaymentPage({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           'Payment Details',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 100),
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(user.picture['large'] ?? ''), // Use large picture URL
//                 child: Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.green, width: 4),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 user.name,
//                 style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               // Text(
//               //   'Email: ${user.email}', // Adjust if email is part of user model
//               //   style: const TextStyle(fontSize: 16),
//               // ),
//               const SizedBox(height: 20),
//               Text(
//                 'Payment Method: ${user.paymentMethod}',
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 'Payment Amount: ₹${user.paymentAmount}',
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';
import '../view_model/user_store.dart';

class PaymentPage extends StatelessWidget {
  final String userId; // Pass user ID to get the latest user

  const PaymentPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Payment Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) {
          final user = userStore.users.firstWhere(
            (u) => u.id == userId,
            orElse: () => User(
              name: 'Not Found',
              paymentMethod: 'N/A',
              paymentAmount: 0.0,
              picture: {'large': ''},
              id: userId
            ),
          );
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.picture['large'] ?? ''),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green, width: 4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Payment Method: ${user.paymentMethod}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Payment Amount: ₹${user.paymentAmount.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
