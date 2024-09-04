import 'package:bw_one/view/user_list_page/widgets/custom_app_bar.dart';
import 'package:bw_one/view/user_list_page/widgets/custom_fab.dart';
import 'package:bw_one/view/user_list_page/widgets/load_users_button.dart';
import 'package:bw_one/view/user_list_page/widgets/payment_dialog.dart';
import 'package:bw_one/view/user_list_page/widgets/user_list_item.dart';
import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../view_model/user_store.dart';
import '../payment_page/payment_page.dart';
import '../visitor_management_page/visitor_management_page.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Visitor Management',
        onClearData: userStore.clearData,
      ),
      body: Observer(
        builder: (_) {
          return userStore.users.isEmpty
              ? Center(
                  child: LoadUsersButton(onPressed: userStore.fetchUsers),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: userStore.users.length,
                  itemBuilder: (context, index) {
                    final user = userStore.users[index];
                    return UserListItem(
                      user: user,
                      onTrailingPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(userId: user.id),
                          ),
                        );
                      },
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return PaymentDialog(
                              user: user,
                              userStore: userStore,
                            );
                          },
                        );
                      },
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: appBarColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(height: 10.0),
      ),
      floatingActionButton: CustomFAB(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VisitorManagementPage(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
