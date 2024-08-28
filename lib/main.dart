import 'package:bw_one/view/user_list_page.dart';
import 'package:bw_one/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: const MaterialApp(
        title: 'User Payment App',
        home: UserListPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
