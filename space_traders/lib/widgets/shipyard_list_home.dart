import 'package:flutter/material.dart';
import 'package:space_traders/models/waypoint.dart';
import '../services/space_trader_service.dart';
import 'shipyard_home.dart';

class ShipyardListHome extends StatefulWidget {
  final String system;
  const ShipyardListHome(this.system, {super.key});

  @override
  State<ShipyardListHome> createState() => _ShipyardListHomeState();
}

class _ShipyardListHomeState extends State<ShipyardListHome> {
  List<Waypoint> waypoints = [];
  @override
  void initState() {
    super.initState();
    SpaceTraderService().getShipyards(widget.system).then((list) {
      setState(() {
        waypoints = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shipyards')),
      body: ListView.builder(
        itemCount: waypoints.length,
        itemBuilder: (BuildContext context, index) {
          final waypoint = waypoints[index];
          return ListTile(
            title: Text(waypoint.symbol),
            subtitle: Text(waypoint.type),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShipyardHome(waypoint)));
            },
          );
        },
      ),
    );
  }
}
