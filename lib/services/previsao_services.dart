import 'package:flutter_dotenv/flutter_dotenv.dart' as env;
import 'package:http/http.dart';


class PreServices {
  final String baseURLAPI = 'dataservice.accuweather.com';
  final String path = '/forecasts/v1/hourly/12hour/${env["CITYCODE"]}';
  final Map<String, String> params = {
    'apikey': env["APIKEY"],
    'language':'pt-BR',
    'metric': 'true'

  };

  Future List<PreHora> recuperarUltimasPre() async {
    final Response resposta = await get(Uri.https(baseURLAPI, path, params));

    if(resposta.statusCode ==200){
      

    } else {
      throw Exception('Falha');
    }  
  }

}