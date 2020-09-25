import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:form_validation/src/blocs/validators.dart';

//mediante el login bloc se puede controlar cuando es valido o no algo que el usuario hizo
class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //establecer los get/set

  //recuperar los datos del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //obtener  el ultimo valor ingresado a los streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  //cerrarlos
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
