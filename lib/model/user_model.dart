class User {
  final String id;
  final String name;
  final String paymentMethod;
  final double paymentAmount;
  final Map<String, String> picture;
  final bool isUpdated;

  User({
    required this.id,
    required this.name,
    required this.paymentMethod,
    required this.paymentAmount,
    required this.picture,
    this.isUpdated = false,
  });

  User copyWith({
    String? id,
    String? name,
    String? paymentMethod,
    double? paymentAmount,
    Map<String, String>? picture,
    bool? isUpdated,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      picture: picture ?? this.picture,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}

