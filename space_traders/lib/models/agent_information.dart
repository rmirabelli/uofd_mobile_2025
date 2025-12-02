class AgentInformation {
  final String accountId;
  final String symbol;
  final String headquarters;
  final int credits;
  final String startingFaction;
  final int shipCount;

  AgentInformation({
    required this.accountId,
    required this.symbol,
    required this.headquarters,
    required this.credits,
    required this.startingFaction,
    required this.shipCount,
  });

  factory AgentInformation.fromJson(Map<String, dynamic> data) {
    return AgentInformation(
      accountId: data['accountId'] as String,
      symbol: data['symbol'] as String,
      headquarters: data['headquarters'] as String,
      credits: data['credits'] as int,
      startingFaction: data['startingFaction'] as String,
      shipCount: data['shipCount'] as int,
    );
  }
}
