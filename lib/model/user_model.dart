// // // In your user_model.dart
// // class User {
// //   final String name;
// //   final String paymentMethod;
// //   final double paymentAmount;

// //   User({
// //     required this.name,
// //     required this.paymentMethod,
// //     required this.paymentAmount,
// //   });

// //   User copyWith({
// //     String? name,
// //     String? paymentMethod,
// //     double? paymentAmount,
// //   }) {
// //     return User(
// //       name: name ?? this.name,
// //       paymentMethod: paymentMethod ?? this.paymentMethod,
// //       paymentAmount: paymentAmount ?? this.paymentAmount,
// //     );
// //   }
// // }
// // In user_model.dart
// class User {
//   final String name;
//   final String paymentMethod;
//   final double paymentAmount;
//   final Map<String, String> picture; // Add this line

//   User({
//     required this.name,
//     required this.paymentMethod,
//     required this.paymentAmount,
//     required this.picture, // Add this line
//   });

//   User copyWith({
//     String? name,
//     String? paymentMethod,
//     double? paymentAmount,
//     Map<String, String>? picture, // Add this line
//   }) {
//     return User(
//       name: name ?? this.name,
//       paymentMethod: paymentMethod ?? this.paymentMethod,
//       paymentAmount: paymentAmount ?? this.paymentAmount,
//       picture: picture ?? this.picture, // Add this line
//     );
//   }
// }
// class User {
//   final String id; // Add this line
//   final String name;
//   final String paymentMethod;
//   final double paymentAmount;
//   final Map<String, String> picture;

//   User({
//     required this.id, // Add this line
//     required this.name,
//     required this.paymentMethod,
//     required this.paymentAmount,
//     required this.picture,
//   });

//   User copyWith({
//     String? id, // Add this line
//     String? name,
//     String? paymentMethod,
//     double? paymentAmount,
//     Map<String, String>? picture,
//   }) {
//     return User(
//       id: id ?? this.id, // Add this line
//       name: name ?? this.name,
//       paymentMethod: paymentMethod ?? this.paymentMethod,
//       paymentAmount: paymentAmount ?? this.paymentAmount,
//       picture: picture ?? this.picture,
//     );
//   }
// }
class User {
  final String id;
  final String name;
  final String paymentMethod;
  final double paymentAmount;
  final Map<String, String> picture;
  final bool isUpdated; // Add this line

  User({
    required this.id,
    required this.name,
    required this.paymentMethod,
    required this.paymentAmount,
    required this.picture,
    this.isUpdated = false, // Add this line
  });

  User copyWith({
    String? id,
    String? name,
    String? paymentMethod,
    double? paymentAmount,
    Map<String, String>? picture,
    bool? isUpdated, // Add this line
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      picture: picture ?? this.picture,
      isUpdated: isUpdated ?? this.isUpdated, // Add this line
    );
  }
}

