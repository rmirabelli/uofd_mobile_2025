import 'package:flutter/material.dart';
import 'package:space_traders/services/space_trader_service.dart';
import '../models/contract.dart';

class ContractHome extends StatelessWidget {
  final Contract contract;
  const ContractHome(this.contract, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contract.type)),
      body: Column(
        children: [
          Text('faction: ${contract.factionSymbol}'),
          Text('Accepted: ${contract.accepted}'),
          Text('when accepted: ${contract.terms.payment.onAccepted}'),
          Text('when fulfilled: ${contract.terms.payment.onFulfilled}'),
          ElevatedButton(
            onPressed: () {
              if (!contract.accepted) {
                SpaceTraderService().acceptContract(contract).then((value) {
                  if (value) {
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return Dialog(child: Text('could not accept contract'));
                      },
                    );
                  }
                });
              }
            },
            child: Text('Accept Contract'),
          ),
        ],
      ),
    );
  }
}
