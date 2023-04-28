import 'package:flutter/material.dart';

class AlturaWiiPageView extends StatefulWidget {
  const AlturaWiiPageView({super.key});

  @override
  AlturaWiiPageViewState createState() => AlturaWiiPageViewState();
}

class AlturaWiiPageViewState extends State<AlturaWiiPageView> {
  double _currentSliderValue = 188;

  String _getPesEPolegadas(double centimetros) {
    int totalPolegadas = (centimetros * 0.393701).round();
    int pes = totalPolegadas ~/ 12;
    int polegadas = totalPolegadas % 12;
    return '$pes\' $polegadas"';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/default-altura.jpg',
                  image: 'https://picsum.photos/800/600',
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Selecione sua altura em centímetros',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 20.0),
                Slider(
                  value: _currentSliderValue,
                  min: 100.0,
                  max: 230.0,
                  divisions: 130,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                Text(
                  '${_currentSliderValue.toStringAsFixed(1)} cm',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18.0),
                ),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  _getPesEPolegadas(_currentSliderValue),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18.0),
                ),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
