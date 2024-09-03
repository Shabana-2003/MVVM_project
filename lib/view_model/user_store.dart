import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import '../model/user_model.dart';
import '../model/visitor_model.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  ObservableList<Visitor> visitors = ObservableList<Visitor>();

  // @action
  // Future<void> fetchUsers() async {
  //   try {
  //     final response = await Dio().get('https://randomuser.me/api/?results=100&gender=male');
  //     final fetchedUsers = (response.data['results'] as List)
  //         .map((user) => User(
  //               name: '${user['name']['first']} ${user['name']['last']}',
  //               paymentMethod: 'Cash',
  //               paymentAmount: 2500.0,
  //               picture: { // Add this block
  //                 'large': user['picture']['large'],
  //                 'medium': user['picture']['medium'],
  //                 'thumbnail': user['picture']['thumbnail'],
  //               },
  //             ))
  //         .toList();

  //     users = ObservableList.of(fetchedUsers);
  //   } catch (e) {
  //     print('Error fetching users: $e');
  //   }
  // }
@action
Future<void> fetchUsers() async {
  try {
    final response = await Dio().get('https://randomuser.me/api/?results=100&gender=male');
    final fetchedUsers = (response.data['results'] as List)
        .map((user) => User(
              id: user['login']['uuid'], // Ensure each user has a unique ID
              name: '${user['name']['first']} ${user['name']['last']}',
              paymentMethod: 'Cash',
              paymentAmount: 2500.0,
              picture: {
                'large': user['picture']['large'],
                'medium': user['picture']['medium'],
                'thumbnail': user['picture']['thumbnail'],
              },
            ))
        .toList();

    users = ObservableList.of(fetchedUsers);
  } catch (e) {
    print('Error fetching users: $e');
  }
}

  @action
  void updatePaymentMethod(User user, String method) {
    final index = users.indexOf(user);
    if (index != -1) {
      users[index] = users[index].copyWith(paymentMethod: method);
    }
  }

  @action
  void updatePaymentAmount(User user, double amount) {
    final index = users.indexOf(user);
    if (index != -1) {
      users[index] = users[index].copyWith(paymentAmount: amount);
    }
  }

  @action
  void addVisitor() {
    visitors.add(Visitor(
      name: 'Visitor ${visitors.length + 1}',
      paymentMethod: 'Cash',
      paymentAmount: 1000.0,
    ));
  }

  @action
  void updateVisitorPaymentMethod(int index, String method) {
    if (index >= 0 && index < visitors.length) {
      visitors[index] = visitors[index].copyWith(paymentMethod: method);
    }
  }

  @action
  void updateVisitorPaymentAmount(int index, double amount) {
    if (index >= 0 && index < visitors.length) {
      visitors[index] = visitors[index].copyWith(paymentAmount: amount);
    }
  }

  @action
  void clearData() {
    users.clear();
    visitors.clear();
  }
}
//git push origin HEAD: