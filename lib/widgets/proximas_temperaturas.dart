import 'package:flutter/material.dart';
import 'package:weather/models/previsao_hora.dart';

class ProximasTemperaturas extends StatelessWidget {
  final List<PrevisaoHora> previsoes;

  const ProximasTemperaturas({Key? key, required this.previsoes})
      : super(key: key);

  Card criarCardPre(int i) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage('images/${previsoes[i].numIcon}.png')),
          const Padding(padding: EdgeInsets.all(2)),
          Text(previsoes[i].horario),
          const Padding(padding: EdgeInsets.all(4)),
          Text('${previsoes[i].temp.toInt()}ºC'),
          const Padding(padding: EdgeInsets.all(5)),
          Text(previsoes[i].descricao),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: previsoes.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return criarCardPre(i);
        },
      ),
    );
  }
}
