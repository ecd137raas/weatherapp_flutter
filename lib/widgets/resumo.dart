import 'package:flutter/material.dart';
import 'package:weather/controllers/tema_controller.dart';

class Resumo extends StatelessWidget {
  final String cidade;
  final String descricao;
  final int tempAtual;
  final int tempMin;
  final int tempMax;
  final int numIcon;

  const Resumo(
      {Key? key,
      required this.cidade,
      required this.descricao,
      required this.tempAtual,
      required this.tempMin,
      required this.tempMax,
      required this.numIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                const Icon(Icons.brightness_6_outlined),
                Switch(
                  value: TemaController.instance.usarTemaDark,
                  onChanged: (valor) {
                    TemaController.instance.trocarTema();
                  },
                )
              ],
            ),
          ],
        ),
        Text(
          cidade,
          style: const TextStyle(fontSize: 18),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        IntrinsicHeight(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/$numIcon.png')),
            const Padding(padding: EdgeInsets.all(2)),
            Text(
              '$tempAtual ºC',
              style: const TextStyle(fontSize: 38),
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('$tempMax ºC'), Text('$tempMin ºC')],
            )
          ],
        )),
        const Padding(padding: EdgeInsets.all(10)),
        Text(descricao)
      ],
    );
  }
}
