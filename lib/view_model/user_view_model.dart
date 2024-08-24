import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UserViewModel extends ChangeNotifier {
  List<dynamic> users = [];
  List<Map<String, dynamic>> visitors = [];

  // Fetch users from API
  Future<void> fetchUsers() async {
    try {
      final response = await Dio().get('https://randomuser.me/api/?results=100&gender=male');
      users = response.data['results'];
      // Initialize payment details for each user
      users = users.map((user) {
        user['paymentMethod'] = 'Cash';
        user['paymentAmount'] = 2500.0;
        return user;
      }).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  // Get payment method for a user
  String getPaymentMethod(dynamic user) {
    return user['paymentMethod'];
  }

  // Update payment method for a user
  void updatePaymentMethod(dynamic user, String method) {
    user['paymentMethod'] = method;
    notifyListeners();
  }

  // Get payment amount for a user
  double getPaymentAmount(dynamic user) {
    return user['paymentAmount'];
  }

  // Update payment amount for a user
  void updatePaymentAmount(dynamic user, double amount) {
    user['paymentAmount'] = amount;
    notifyListeners();
  }

  // Add a new visitor
  void addVisitor() {
    visitors.add({
      'name': 'Visitor ${visitors.length + 1}',
      'paymentMethod': 'Cash',
      'paymentAmount': 1000.0,
    });
    notifyListeners();
  }

  // Update payment method for a visitor
  void updateVisitorPaymentMethod(int index, String method) {
    visitors[index]['paymentMethod'] = method;
    notifyListeners();
  }

  // Update payment amount for a visitor
  void updateVisitorPaymentAmount(int index, double amount) {
    visitors[index]['paymentAmount'] = amount;
    notifyListeners();
  }

  // Clear all data
  void clearData() {
    users.clear();
    visitors.clear();
    notifyListeners();
  }
}


