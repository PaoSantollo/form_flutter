import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
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
      padding: EdgeInsets.only(top: 50.0),
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

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    //para sacra las dimensiones de la pantalla
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            //separacion con el icono
            margin: EdgeInsets.symmetric(vertical: 25.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  //blur de la sombra
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 60.0),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                _crearPassword(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          Text('Olvido la contraseña? '),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    //ahora se tiene la capacidad de escuchar los cambios que suceden
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'Ejemplo@correo.com',
              labelText: 'Correo Electronico',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Contraseña',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    //formValidStream
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _logic(bloc, context) : null,
        );
      },
    );
  }

  _logic(LoginBloc bloc, BuildContext context) {
    print('===========');
    print('Email : ${bloc.email}');
    print('Password: ${bloc.password}');
    print('===========');
    Navigator.pushNamed(context, 'home');
  }
}
