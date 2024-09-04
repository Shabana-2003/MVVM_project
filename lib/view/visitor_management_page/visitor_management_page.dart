import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:bw_one/view/utils/size/sized_box.dart';
import 'package:bw_one/view/utils/style/text_style.dart';
import 'package:bw_one/view/visitor_management_page/widgets/visitor_widgets.dart';
import 'package:bw_one/view_model/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VisitorManagementPage extends StatelessWidget {
  const VisitorManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      backgroundColor:kBlack,
      appBar: AppBar(
        backgroundColor:appBarColor,
        title:Text(
          'Visitor Management',
          style: paymentTextStyle,
        ),
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: userStore.visitors.isEmpty
                    ? Center(
                        child: Text(
                          'No visitors added yet.',
                          style: paymentTextStyle,
                        ),
                      )
                    : ListView.builder(
                        itemCount: userStore.visitors.length,
                        itemBuilder: (context, index) {
                          return VisitorCard(
                            index: index,
                            userStore: userStore,
                          );
                        },
                      ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  backgroundColor: kyellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  userStore.addVisitor();
                },
                child: Text(
                  'Add Visitor',
                  style: blackTextStyle,
                ),
              ),
              kHeight30,
            ],
          );
        },
      ),
    );
  }
}
