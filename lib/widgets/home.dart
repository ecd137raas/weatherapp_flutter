import 'package:flutter/material.dart';
import 'package:weather/services/previsao_services.dart';
import 'package:weather/widgets/proximas_temperaturas.dart';
import 'package:weather/widgets/resumo.dart';
import '../models/previsao_hora.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<PreHora> ultimasTemp;

  @override
  void initState() {
    super.initState();
    PreServices service = PreServices();
    ultimasTemp = service.recuperarUltimasPre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          const Resumo(
            cidade: 'Jundiaí',
            descricao: 'Nublado',
            tempAtual: 23,
            tempMax: 28,
            tempMin: 18,
            numIcon: 6,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          ProximasTemperaturas(
            valores: ultimasTemp,
          )
        ],
      )),
    );
  }
}
