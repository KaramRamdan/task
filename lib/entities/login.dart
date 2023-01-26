import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final bool status;
  final String massage;
  final LoginData data;

  const Login({required this.status,required this.massage,required this.data});

  @override
  List<Object> get props => [status, massage, data];
}

class LoginData extends Equatable {
  final String token;

  const LoginData({required this.token});

  @override
  List<Object> get props => [token, ];
}
