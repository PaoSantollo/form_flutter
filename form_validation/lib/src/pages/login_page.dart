import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0),
      ])),
    );

    final circulos = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    final iconos = Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
          SizedBox(
            height: 10.0,
            width: double.infinity, //agarra todo el ancho
          ),
          Text(
            'Paola Santollo',
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          )
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        //para posicionar los circulos
        Positioned(
          child: circulos,
          top: 60.0,
          left: 350.0,
        ),
        //circulo
        Positioned(
          child: circulos,
          top: 200.0,
          left: 230.0,
        ),
        Positioned(
          child: circulos,
          top: -40.0,
          left: -10.0,
        ),
        Positioned(
          child: circulos,
          top: 120.0,
          left: 20.0,
        ),
        iconos,
      ],
    );
  }
}
