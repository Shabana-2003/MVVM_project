import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UserViewModel extends ChangeNotifier {
  List<dynamic> users = [];
  List<Map<String, dynamic>> visitors = [];

  Future<void> fetchUsers() async {
    try {
      final response = await Dio().get('https://randomuser.me/api/?results=100&gender=male');
      users = response.data['results'];
     
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

  String getPaymentMethod(dynamic user) {
    return user['paymentMethod'];
  }

  void updatePaymentMethod(dynamic user, String method) {
    user['paymentMethod'] = method;
    notifyListeners();
  }

  double getPaymentAmount(dynamic user) {
    return user['paymentAmount'];
  }

  void updatePaymentAmount(dynamic user, double amount) {
    user['paymentAmount'] = amount;
    notifyListeners();
  }

  void addVisitor() {
    visitors.add({
      'name': 'Visitor ${visitors.length + 1}',
      'paymentMethod': 'Cash',
      'paymentAmount': 1000.0,
    });
    notifyListeners();
  }

  void updateVisitorPaymentMethod(int index, String method) {
    visitors[index]['paymentMethod'] = method;
    notifyListeners();
  }

  void updateVisitorPaymentAmount(int index, double amount) {
    visitors[index]['paymentAmount'] = amount;
    notifyListeners();
  }

  void clearData() {
    users.clear();
    visitors.clear();
    notifyListeners();
  }
}


