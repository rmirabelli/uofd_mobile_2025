import 'package:flutter/material.dart';
import 'package:space_traders/models/agent_information.dart';
import 'package:space_traders/models/waypoint.dart';
import 'package:space_traders/widgets/contract_list_home.dart';
import 'package:space_traders/widgets/shipyard_list_home.dart';
import '../services/space_trader_service.dart';

class AgentHome extends StatefulWidget {
  const AgentHome({super.key});

  @override
  State<AgentHome> createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {
  AgentInformation? agentInformation;
  Waypoint? waypoint;

  @override
  void initState() {
    super.initState();
    SpaceTraderService().getAgentData().then((agentInformation) {
      setState(() {
        this.agentInformation = agentInformation;
      });
      SpaceTraderService().getStartingLocation(agentInformation).then((location) {
        waypoint = location;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (agentInformation != null) {
      return Scaffold(
        appBar: AppBar(title: Text('Space Traders')),
        body: Column(
          children: [
            Text(agentInformation!.symbol),
            Text(agentInformation!.startingFaction),
            Text('ships: ${agentInformation!.shipCount}'),
            Text('credits: ${agentInformation!.credits}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContractListHome()));
              },
              child: Text('Contracts'),
            ),
            ElevatedButton(
              onPressed: () {
                final split = agentInformation!.headquarters.split('-');
                final system = '${split[0]}-${split[1]}';
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShipyardListHome(system)));
              },
              child: Text('Shipyards'),
            ),
          ],
        ),
      );
    } else {
      return Placeholder();
    }
  }
}
