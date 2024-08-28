import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final dynamic user;

  const PaymentPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Payment Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user['picture']['large']),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 4),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${user['name']['first']} ${user['name']['last']}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Email: ${user['email']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Method: ${user['paymentMethod']}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Payment Amount: ₹${user['paymentAmount'].toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
