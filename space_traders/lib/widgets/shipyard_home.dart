import 'package:flutter/material.dart';
import 'package:space_traders/services/space_trader_service.dart';
import '../models/waypoint.dart';
import '../models/shipyard.dart';

class ShipyardHome extends StatefulWidget {
  final Waypoint waypoint;
  const ShipyardHome(this.waypoint, {super.key});

  @override
  State<ShipyardHome> createState() => _ShipyardHomeState();
}

class _ShipyardHomeState extends State<ShipyardHome> {
  Shipyard? shipyard;
  @override
  void initState() {
    super.initState();
    SpaceTraderService().getShips(widget.waypoint).then((shipyard) {
      setState(() {
        this.shipyard = shipyard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shipyard != null) {
      return Scaffold(
        appBar: AppBar(title: Text("Shipyard")),
        body: ListView.builder(
          itemCount: shipyard!.shipTypes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(shipyard!.shipTypes[index]),
              onTap: () {
                SpaceTraderService().purchaseShip(widget.waypoint, shipyard!.shipTypes[index]).then((value) {
                  print(value);
                });
              },
            );
          },
        ),
      );
    } else {
      return const Placeholder();
    }
  }
}
