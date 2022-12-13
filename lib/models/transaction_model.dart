import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/models/catogory.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 3)
class transation_model {
  @HiveField(0)
  String purpose;

  @HiveField(1)
  double amount;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  catagorytype type;

  @HiveField(4)
  catagorymodel category;

  @HiveField(5)
  String? id;

  transation_model({
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
