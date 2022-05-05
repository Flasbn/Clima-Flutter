import 'package:flutter/material.dart';
import 'package:uni_clima/model/clima_model.dart';

class ClimaWidget extends StatelessWidget {
  const ClimaWidget({Key? key, required this.climaData}) : super(key: key);

  final CLimaModel climaData;

  String primeraMaiuscula(String s)

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "http://openweathermap.org/img/wn/${climaData.icone}@2x.png"
          fit: BoxFit.fill,
          width: 120,
        ),
        Text(
          "${climaData.temperatura.toStringAsFixed(0)}°C",
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          climaData.descricao,
          style: const TextStyle(fontSize: 50),
        ),
      ],
    );
  }
}
