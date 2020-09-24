import 'dart:async';

import 'package:form_validation/src/blocs/validators.dart';

//mediante el login bloc se puede controlar cuando es valido o no algo que el usuario hizo
class LoginBloc with Validators {
  final _emailController = StreamController<String>.broadcast();

  final _passwordController = StreamController<String>.broadcast();

  //establecer los get/set

  //recuperar los datos del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  //insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //cerrarlos
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
