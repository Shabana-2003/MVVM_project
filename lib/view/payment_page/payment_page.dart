import 'package:bw_one/view/payment_page/widgets/user_avatar.dart.dart';
import 'package:bw_one/view/payment_page/widgets/user_info.dart';
import 'package:bw_one/view/utils/colors/colors.dart';
import 'package:bw_one/view/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../model/user_model.dart';
import '../../view_model/user_store.dart';

class PaymentPage extends StatelessWidget {
  final String userId;

  const PaymentPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: appBarColorr,
        title: Text(
          'Payment Details',
          style: paymentTextStyle,
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
              id: userId,
            ),
          );
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 600,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: greyPaymentBox,
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 10.0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 90),
                    UserAvatar(
                      imageUrl: user.picture['large'] ?? '',
                      isUpdated: user.isUpdated,
                    ),
                    UserInfo(
                      name: user.name,
                      paymentMethod: user.paymentMethod,
                      paymentAmount: user.paymentAmount,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
