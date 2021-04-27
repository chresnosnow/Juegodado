import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.lightBlue,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int NumDadoIz = 2;
  int NumDadoDer = 3;
  //Como parte de las buenas practicas creamos funciones.
  void ChangeFace() {
    setState(() {
      NumDadoIz = Random().nextInt(6) +
          1; //suma 1 en caso de que nuestro indice no tenga un 0.
      NumDadoDer = Random().nextInt(6) +
          1; //suma 1 en caso de que nuestro indice no tenga un 0.
    });
    print('El Numero de Dado Izquierdo es: ' + NumDadoIz.toString());
    print('El Numero de Dado Derecho es: ' + NumDadoDer.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                ChangeFace();
              },
              child: Image.asset('images/dice$NumDadoIz.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                ChangeFace();
              },
              child: Image.asset('images/dice$NumDadoDer.png'),
            ),
          ),
        ],
      ),
    );
  }
}
