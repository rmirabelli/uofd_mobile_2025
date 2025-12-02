import 'package:flutter/material.dart';
import 'package:space_traders/services/space_trader_service.dart';
import '../models/contract.dart';
import 'contract_home.dart';

class ContractListHome extends StatefulWidget {
  const ContractListHome({super.key});

  @override
  State<ContractListHome> createState() => _ContractListHomeState();
}

class _ContractListHomeState extends State<ContractListHome> {
  List<Contract> contracts = [];

  @override
  void initState() {
    super.initState();
    SpaceTraderService().getContracts().then((value) {
      setState(() {
        contracts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contracts')),
      body: ListView.builder(
        itemCount: contracts.length,
        itemBuilder: (BuildContext bc, int index) {
          final contract = contracts[index];
          return ListTile(
            title: Text(contract.type),
            subtitle: Text('Accepted: ${contract.accepted}'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContractHome(contract)));
            },
          );
        },
      ),
    );
  }
}
