import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final dynamic user;

  PaymentPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            SizedBox(height: 20),
            Text(
              '${user['name']['first']} ${user['name']['last']}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${user['email']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Payment Method: ${user['paymentMethod']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Payment Amount: ₹${user['paymentAmount'].toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to User List'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
