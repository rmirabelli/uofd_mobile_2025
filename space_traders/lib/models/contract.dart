import 'terms.dart';

class Contract {
  final String id;
  final String factionSymbol;
  final String type;
  final Terms terms;
  final bool accepted;
  final bool fulfilled;
  final DateTime expiration;
  final DateTime deadlineToAccept;

  Contract({
    required this.id,
    required this.factionSymbol,
    required this.type,
    required this.terms,
    required this.accepted,
    required this.fulfilled,
    required this.expiration,
    required this.deadlineToAccept,
  });

  factory Contract.fromJson(Map<String, dynamic> data) {
    return Contract(
      id: data['id'],
      factionSymbol: data['factionSymbol'],
      type: data['type'],
      terms: Terms.fromJson(data['terms']),
      accepted: data['accepted'],
      fulfilled: data['fulfilled'],
      expiration: DateTime.parse(data['expiration']),
      deadlineToAccept: DateTime.parse(data['deadlineToAccept']),
    );
  }
}
