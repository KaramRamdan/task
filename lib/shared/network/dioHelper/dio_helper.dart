// ignore_for_file: file_names
import 'package:dio/dio.dart';

class DioHelper {
  static  Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://scanner.elhsnaaa-eg.com/api/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options .headers={
      'Accept': 'application/json',
      'Connection':'keep-alive',
      'Accept-Encoding':'gzip, deflate, br',
      'Authorization': token??'',
    };
    return  await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers ={
      'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
      'Authorization': token??'',
      'Connection':'keep-alive',
      'Accept':'*/*',
      'Accept-Encoding':'gzip, deflate, br',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


}