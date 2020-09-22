import 'dart:async';

class LoginBloc {
  final _emailController = StreamController<String>.broadcast();

  final _passwordController = StreamController<String>.broadcast();

  //establecer los get/set

  //recuperar los datos del stream
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  //insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //cerrarlos
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
