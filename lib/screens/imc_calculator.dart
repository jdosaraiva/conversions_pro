import 'package:flutter/material.dart';

class IMCCalculatorPage extends StatefulWidget {
  const IMCCalculatorPage({super.key});

  @override
  IMCCalculatorPageState createState() => IMCCalculatorPageState();
}

class IMCCalculatorPageState extends State<IMCCalculatorPage> {
  double _altura = 170.0;
  double _peso = 70.0;
  double _imc = 0.0;

  @override
  void initState() {
    super.initState();
    _calculaIMC();
  }

  void _calculaIMC() {
    _imc = _peso / ((_altura / 100) * (_altura / 100));
  }

  void _atualizarIMC() {
    setState(() {
      _calculaIMC();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/default-imc.jpg',
              image: 'https://picsum.photos/800/600',
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'Entre com sua altura em centímetros:',
            style: TextStyle(fontSize: 20),
          ),
          Slider(
            value: _altura,
            min: 70,
            max: 250,
            divisions: 180,
            onChanged: (double value) {
              setState(() {
                _altura = value;
              });
              _atualizarIMC();
            },
          ),
          Text('${_altura.toInt()} cm'),
          const Text(
            'Entre com seu peso em kg:',
            style: TextStyle(fontSize: 20),
          ),
          Slider(
            value: _peso,
            min: 25,
            max: 300,
            divisions: 275,
            onChanged: (double value) {
              setState(() {
                _peso = value;
              });
              _atualizarIMC();
            },
          ),
          Text('${_peso.toInt()} kg'),
          Text(
            'IMC: ${_imc.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            _imc >= 18.5 && _imc <= 24.9
                ? 'Você está com o peso normal.'
                : _imc < 18.5
                ? 'Você está abaixo do peso.'
                : 'Você está acima do peso.',
            style: TextStyle(
                fontSize: 20,
                color: _imc >= 18.5 && _imc <= 24.9
                    ? Colors.blue
                    : _imc < 18.5
                    ? Colors.blueGrey
                    : Colors.red,

            ),
          ),
        ],
      ),
    );
  }
}
