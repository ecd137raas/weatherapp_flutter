// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import '../models/previsao_hora.dart';

class ProximasTemperaturas extends StatelessWidget {
  final List<PreHora> valores;

  const ProximasTemperaturas({Key? key, required this.valores})
      : super(key: key);

  Card criarCardPre(int i) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage('images/${valores[i].numIcon}.png')),
          const Padding(padding: EdgeInsets.all(2)),
          Text(valores[i].horario),
          const Padding(padding: EdgeInsets.all(4)),
          Text('${valores[i].temp}ºC'),
          const Padding(padding: EdgeInsets.all(5)),
          Text(valores[i].descricao),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: valores.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return criarCardPre(i);
        },
      ),
    );
  }
}
