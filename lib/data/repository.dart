import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superheroe_app/data/models/superheroe_response.dart';

class Repository {
  Future<SuperheroeResponse?> TraerInfoSuper(String nombre) async {
    final url = Uri.parse(
      'https://superheroapi.com/api/3b931a2d6e4384b19466ee5dcfb6e61e/search/$nombre',
    );
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200){
      var decodedJson = jsonDecode(respuesta.body);
      SuperheroeResponse superheroeResponse = SuperheroeResponse.fromJson(decodedJson);
      return superheroeResponse;
    }else{
      //throw Exception("Error al obtener usuarios");
      return null;
    }
  }
}
