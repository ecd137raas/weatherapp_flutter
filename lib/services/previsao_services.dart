import 'package:weather/models/previsao_hora.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'dart:convert';

class PrevisaoServices {
  final String baseURLAPI = 'dataservice.accuweather.com';
  final String path = '/forecasts/v1/hourly/12hour/${dotenv.env['CITY_CODE']}';
  final Map<String, String> params = {
    'apikey': '${dotenv.env['API_KEY']}',
    'language': 'pt-BR',
    'metric': 'true'
  };

  Future<List<PrevisaoHora>> recuperarUltimasPrevisao() async {
    final Response resposta = await get(Uri.https(baseURLAPI, path, params));

    if (resposta.statusCode == 200) {
      Iterable it = json.decode(resposta.body);
      List<PrevisaoHora> previsoes =
          List.from(it.map((objJson) => PrevisaoHora.transformarJSON(objJson)));
      return previsoes;
    } else {
      throw Exception('Falha');
    }
  }
}
