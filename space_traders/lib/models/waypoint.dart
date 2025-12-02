import 'trait.dart';

class Waypoint {
  final String symbol;
  final String type;
  final String systemSymbol;
  final int x;
  final int y;
  final List<Trait> traits;

  Waypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
    required this.traits,
  });

  factory Waypoint.fromJson(Map<String, dynamic> data) {
    final traitsList = (data['traits'] as List<dynamic>).map((e) {
      return e as Map<String, dynamic>;
    }).toList();
    final traits = traitsList.map((e) {
      return Trait.fromJson(e);
    }).toList();
    return Waypoint(
      symbol: data['symbol'],
      type: data['type'],
      systemSymbol: data['systemSymbol'],
      x: data['x'],
      y: data['y'],
      traits: traits,
    );
  }
}
