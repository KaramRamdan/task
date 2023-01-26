import 'package:task1/entities/scan.dart';

class ScansModel extends Scan {
  const ScansModel(
      {required super.status, required super.massage, required super.scanData});

  factory ScansModel.fromJson(Map<String, dynamic> json) => ScansModel(
        status: json['status'],
        massage: json['massage'],
        scanData: List<ScansDataModel>.from(json['data'].map((e) => e)),
      );
}

class ScansDataModel extends ScanData {
  const ScansDataModel(
      {required super.id,
      required super.pin,
      required super.serial,
      required super.phoneType,
      required super.categoryId});
  factory ScansDataModel.fromJson(Map<String, dynamic> json) => ScansDataModel(
      id: json['id'],
      pin: json['pin'],
      serial: json['serial'],
      phoneType: json['phone_type'],
      categoryId:json[' category_id']);
}
