import 'package:superheroe_app/data/models/superheroedetalle_response.dart';

class SuperheroeResponse {
  final String response;
  final List<SuperheroedetalleResponse> result;

  SuperheroeResponse({required this.response, required this.result});

  factory SuperheroeResponse.fromJson(Map<String, dynamic> json) {


     var list = json["results"] as List;
     List<SuperheroedetalleResponse> listaHeroes = list.map((hero) => SuperheroedetalleResponse.fromJson(hero)).toList();

    return SuperheroeResponse(
      response: json['response'], result: listaHeroes);
  }

}