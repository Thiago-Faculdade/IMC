import 'dart:html';
import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    home: const IMC(),
  ));
}
class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMC();
}
class Resultados extends StatelessWidget{
  final double imc;
  final double igc;

  const Resultados({super.key, required this.imc, required this.igc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do seu IMC é IGC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'IMC: ${imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'IGC: ${igc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),  
          ],
        ),
      ),
    );
  }
}
class _IMC extends State<IMC> {

  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  bool _sexo = true; // true = masculino, false = feminino
  late double _imc;
  late double _igc;

  @override
  Widget build(BuildContext context){
  	return(Scaffold(
        appBar: AppBar(
          title:const Text('Calculo do seu IMC'),
       ),
       body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.accessibility_rounded,
          color: Colors.lightBlue,
          size: 180.0,
        ),
         Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _alturaController,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.green, fontSize: 25.0),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _pesoController,
                decoration: InputDecoration(
                  labelText: 'Peso',
                  labelStyle: const TextStyle(color: Colors.green),
                  border: const OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.green, fontSize: 25.0),

                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _idadeController,
                decoration: InputDecoration(
                  labelText: 'Idade',
                  labelStyle: const TextStyle(color: Colors.green),
                  border: const OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.green, fontSize: 25.0),

                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Masculino'),
                Switch(
                  value: _sexo,
                  onChanged: (value) {
                    setState(() {
                      _sexo = value;
                    });
                  },
                ),
                Text('Feminino'),
              ],
            ),
            Container(
              margin: (EdgeInsets.only(top: 10,left: 25,right: 600)),
              child: ElevatedButton(
              onPressed: () {
                double altura = double.parse(_alturaController.text);
                double peso = double.parse(_pesoController.text);
                int idade = int.parse(_idadeController.text);
                double sexo = _sexo ? 1.0 : 0.8;
                setState(() {
                  _imc = peso / (altura * altura);
                  _igc = (1.2 * _imc) + (0.23 * idade) - (10.8 * sexo) - 5.4;
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultados(imc: _imc, igc: _igc),
                  ),
                );
              },
              child: const Text('Calcular o seu IMC'),
            )
            ),
           
          ],
         )
       ]
    )
    )
    );
  }
  
}
