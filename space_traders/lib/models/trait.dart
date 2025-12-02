class Trait {
  final String symbol;
  final String name;
  final String description;

  Trait({required this.symbol, required this.name, required this.description});

  factory Trait.fromJson(Map<String, dynamic> data) {
    return Trait(
      symbol: data['symbol'] as String,
      name: data['name'] as String,
      description: data['description'] as String,
    );
  }
}
