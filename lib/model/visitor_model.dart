class Visitor {
  final String name;
  final String paymentMethod;
  final double paymentAmount;

  Visitor({
    required this.name,
    required this.paymentMethod,
    required this.paymentAmount,
  });

  Visitor copyWith({
    String? name,
    String? paymentMethod,
    double? paymentAmount,
  }) {
    return Visitor(
      name: name ?? this.name,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentAmount: paymentAmount ?? this.paymentAmount,
    );
  }
}
