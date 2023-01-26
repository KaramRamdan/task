import 'package:equatable/equatable.dart';

class Scan extends Equatable {
  final bool status;
  final String massage;
  final List<ScanData> scanData;

  const Scan({
   required this.status,
   required this.massage,
   required this.scanData,
  });

  @override
  List<Object> get props => [status, massage, scanData];
}

class ScanData extends Equatable {
  final int id;
  final int pin;
  final int serial;
  final String phoneType;
  final int categoryId;

  const ScanData({
  required  this.id,
    required this.pin,
    required this.serial,
    required this.phoneType,
    required this.categoryId,
  });

  @override
  List<Object> get props => [id, pin, serial, phoneType, categoryId];
}
