
import 'package:task1/entities/login.dart';

class LoginModel extends Login{

  const LoginModel({required super.status, required super.massage,required super.data});
  factory LoginModel.fromJson(Map<String,dynamic>json)=>LoginModel(
    status: json['status'],
    massage: json['massage'],
    data: LoginDateModel.fromJson(json['data']),
  );
}
class LoginDateModel extends LoginData{
  const  LoginDateModel({required super.token,});
  factory  LoginDateModel.fromJson(Map<String,dynamic>json)=>LoginDateModel(token: json['token'],);


}