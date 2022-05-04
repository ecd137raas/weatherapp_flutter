import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather/models/previsao_hora.dart';
import 'package:weather/services/previsao_services.dart';
import 'package:weather/widgets/proximas_temperaturas.dart';
import 'package:weather/widgets/resumo.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<PrevisaoHora>> ultimasPrevisoes;

  @override
  void initState() {
    super.initState();
    carregarPrevisoes();
  }

  void carregarPrevisoes() {
    PrevisaoServices service = PrevisaoServices();
    ultimasPrevisoes = service.recuperarUltimasPrevisao();
  }

  Future<void> atualizarPrevisoes() async {
    setState(() => carregarPrevisoes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<PrevisaoHora>>(
            future: ultimasPrevisoes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PrevisaoHora>? previsoes = snapshot.data;
                double tempAtual = previsoes![0].temp;
                double minTemp = double.maxFinite;
                double maxTemp = double.negativeInfinity;
                for (var obj in previsoes) {
                  if (obj.temp < minTemp) {
                    minTemp = obj.temp;
                  }
                  if (obj.temp > maxTemp) {
                    maxTemp = obj.temp;
                  }
                }
                String desc = previsoes[0].descricao;
                int numIco = previsoes[0].numIcon;

                return Column(
                  children: [
                    Resumo(
                      cidade: 'Jundiaí',
                      descricao: desc,
                      tempAtual: tempAtual,
                      tempMax: maxTemp,
                      tempMin: minTemp,
                      numIcon: numIco,
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ProximasTemperaturas(
                      previsoes: previsoes.sublist(1, previsoes.length),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text('Falha ao conectar no servidor, aguarde!');
              }

              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
