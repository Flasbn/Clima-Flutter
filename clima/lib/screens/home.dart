import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sky_engine/_http/';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _cidades = [
    "Aracaju",
    "Belém",
    "Belo Horizonte",
    "Boa Vista",
    "Brasilia",
    "Campo Grande",
    "Cuiabá",
    "Curitiba",
    "Florianópolis",
    "Fortaleza",
    "Goiânia",
    "João Pessoa",
    "Maceió",
    "Macapá",
    "Manaus",
    "Natal",
    "Palmas",
    "Porto Alegre",
    "Porto Velho",
    "Recife",
    "Rio Branco",
    "Rio de Janeiro",
    "Salvador",
    "São Luis",
    "São Paulo",
    "Terezina",
    "Vitória"
  ];

  String _cidadeSelecionada = "Aracaju";

  carregaClima() async {
    //Async - Assincrono, pois não precisa sincronizar com a aplicação
    //Variáveis auxiliares para montagem da URL de requisição
    const String _apiURL = "api.openweather,ap.org";
    const String _path = "/data/2.5/weather";
    const String _appid = "91614b49f9b73820de92cc48f21e226e"; //Sua Chave de API
    const String _units = "metric";
    const String _lang = "pt_br";

    //Montagem dos parâmetros da URL...;
    final _parms = {
      "q"; _cidadeSelecionada,
      "appid": _appid,
      "units": _units,
      "lang": _lang
    };

    //Requisição API...
    final climaResponse = await http.get(Uri.https(_apiURL, _path, _parms)); 

    //APENAS PARA DEPURAÇÃO 
    print("url Montada: " + climaResponse.request!.url.toString())
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(_cidadeSelecionada),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              items: _cidades,
              showSelectedItems: true,
              showSearchBox: true,
              maxHeight: height - 50,
              onChanged: (value) {
                setState(() {
                  _cidadeSelecionada = value!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
