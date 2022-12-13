import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/models/transaction_model.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class transactionabtract {
  Future<void> aadtraction(transation_model transactionmodeling);
  Future<List<transation_model>> getalltransaction();
}

class transationdbing implements transactionabtract {
  transationdbing._internal();
  static transationdbing instance = transationdbing._internal();
  factory transationdbing() {
    return instance;
  }

  ValueNotifier<List<transation_model>> listtrans = ValueNotifier([]);

  @override
  Future<void> aadtraction(transation_model transactionmodeling) async {
    final openboxtrans = await Hive.openBox(TRANSACTION_DB_NAME);
    openboxtrans.put(transactionmodeling.id, transactionmodeling);
  }

  Future<void> refresh() async {
    final list = await getalltransaction();
    listtrans.value.clear();
    listtrans.value.addAll(list);
    listtrans.notifyListeners();
  }

  @override
  Future<List<transation_model>> getalltransaction() async {
    final openboxtrans =
        await Hive.openBox<transation_model>(TRANSACTION_DB_NAME);
    return openboxtrans.values.toList();
  }
}
