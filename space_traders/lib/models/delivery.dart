class Delivery {
  final String tradeSymbol;
  final String destinationSymbol;
  final int unitsRequired;
  final int unitsFulfilled;

  Delivery({
    required this.tradeSymbol,
    required this.destinationSymbol,
    required this.unitsRequired,
    required this.unitsFulfilled,
  });

  factory Delivery.fromJson(Map<String, dynamic> data) {
    return Delivery(
      tradeSymbol: data['tradeSymbol'],
      destinationSymbol: data['destinationSymbol'],
      unitsFulfilled: data['unitsFulfilled'],
      unitsRequired: data['unitsRequired'],
    );
  }
}
