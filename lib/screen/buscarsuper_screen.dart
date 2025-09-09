import 'package:flutter/material.dart';
import 'package:superheroe_app/data/models/superheroe_response.dart';
import 'package:superheroe_app/data/models/superheroedetalle_response.dart';
import 'package:superheroe_app/data/repository.dart';
import 'package:superheroe_app/screen/detallesuper_screen.dart';

class BuscarsuperScreen extends StatefulWidget {
  const BuscarsuperScreen({super.key});

  @override
  State<BuscarsuperScreen> createState() => _BuscarsuperScreenState();
}

class _BuscarsuperScreenState extends State<BuscarsuperScreen> {
  Future<SuperheroeResponse?>? _superheroeinfo;
  Repository repository = Repository();
  bool _textoVacio = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buscaqueda Super Heroe")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Busca un superheroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _textoVacio = value.isEmpty;
                  _superheroeinfo = repository.TraerInfoSuper(value);
                });
              },
            ),
          ),

          listado(_textoVacio),
        ],
      ),
    );
  }

  FutureBuilder<SuperheroeResponse?> listado(bool textoVacio) {
    return FutureBuilder(
      future: _superheroeinfo,
      builder: (context, snapshot) {
        if (textoVacio) {
          return Text("Digitá algun Super H...");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("WError: ${snapshot.error} ");
        } else if (snapshot.hasData) {
          var listaHeroes = snapshot.data?.result;
          return Expanded(
            child: ListView.builder(
              itemCount: listaHeroes?.length ?? 0,
              itemBuilder: (context, index) {
                if (listaHeroes != null) {
                  //return Text(listaHeroes[index].name);
                  return itemSuperHeroe(listaHeroes[index]);
                } else {
                  return Text("error");
                }
              },
            ),
          );
        } else {
          return Text("nada de datos ");
        }
      },
    );
  }

  Padding itemSuperHeroe(SuperheroedetalleResponse item) => Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),

    child: GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetallesuperScreen(superhero: item),
        ),
      ),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
        ),
        child: Column(
          children: [
            //Text("${item.id} ${item.name}"),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item.url,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: AlignmentGeometry.directional(0, -0.6),
              ),
            ),
            Text(
              "${item.id} ${item.name}",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
