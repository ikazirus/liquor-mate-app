import 'package:liquor_mate/index.dart';

enum LiquorRecordType {
  addNewBottle,
  consumed,
}

class LiquorRecord {
  final int id;
  final LiquorBottle bottle;
  final DateTime dateTime;
  final LiquorRecordType recordType;
  final double miliLitres;

  LiquorRecord(
      this.id, this.bottle, this.dateTime, this.recordType, this.miliLitres);
}
