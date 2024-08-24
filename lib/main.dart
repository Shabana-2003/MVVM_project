import 'package:bw_one/view/user_list_page.dart';
import 'package:bw_one/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/api_service.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: MaterialApp(
        title: 'User Payment App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserListPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
