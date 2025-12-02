class Shipyard {
  final String symbol;
  final List<String> shipTypes;
  final int modificationsFee;

  Shipyard({required this.symbol, required this.shipTypes, required this.modificationsFee});

  factory Shipyard.fromJson(Map<String, dynamic> data) {
    final List<dynamic> list = data['shipTypes'];
    final List<Map<String, dynamic>> mapped = list.map((e) => e as Map<String, dynamic>).toList();
    final shipTypes = mapped.map((e) => e['type'] as String).toList();
    return Shipyard(symbol: data['symbol'], modificationsFee: data['modificationsFee'], shipTypes: shipTypes);
  }
}
