part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class Login extends LoginEvent {
  final String number;
  final String password;
  final String deviceToken;
  Login(
      {required this.number,
      required this.password,
      required this.deviceToken});
}
