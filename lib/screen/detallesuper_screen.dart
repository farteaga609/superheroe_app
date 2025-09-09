import 'package:flutter/material.dart';
import 'package:superheroe_app/data/models/superheroedetalle_response.dart';
import 'package:superheroe_app/screen/bloquepoder.dart';

class DetallesuperScreen extends StatelessWidget {
  final SuperheroedetalleResponse superhero;
  const DetallesuperScreen({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Super Heroe ${superhero.name}")),

      body: Column(
        children: [
          Image.network(
            superhero.url,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: AlignmentGeometry.directional(0, -0.6),
          ),

          Text(
            superhero.name,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          Text(
            "Nombre real: ${superhero.nombrereal}",
            style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
          ),

          SizedBox(
            width: double.infinity,
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Bloquepoder(
                  power: double.parse(superhero.powerstats.power),
                  color: Colors.red,
                  textopod: "power",
                ),

                Bloquepoder(
                  power: double.parse(superhero.powerstats.combat),
                  color: Colors.yellow,
                  textopod: "combat",
                ),

                Bloquepoder(
                  power: double.parse(superhero.powerstats.durability),
                  color: Colors.blue,
                  textopod: "durability",
                ),

                Bloquepoder(
                  power: double.parse(superhero.powerstats.intelligence),
                  color: Colors.green,
                  textopod: "intelligence",
                ),

                Bloquepoder(
                  power: double.parse(superhero.powerstats.speed),
                  color: Colors.orange,
                  textopod: "speed",
                ),

                Bloquepoder(
                  power: double.parse(superhero.powerstats.strength),
                  color: Colors.black,
                  textopod: "Fuerza",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
