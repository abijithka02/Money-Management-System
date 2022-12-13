import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/models/catogory.dart';

const CATAGORY_DB_NAME = 'catagory_db';

abstract class catagoryfunction {
  Future<List<catagorymodel>> getcatogory();
  Future<void> insertcatagory(catagorymodel value);
  Future<void> deletecategory(String id);
  
}

class catagorydb implements catagoryfunction {
  catagorydb.internal();
  static catagorydb instance = catagorydb.internal();
  factory catagorydb() {
    return instance;
  }
  ValueNotifier<List<catagorymodel>> incomecategory = ValueNotifier([]);
  ValueNotifier<List<catagorymodel>> expensecategory = ValueNotifier([]);

  @override
  Future<void> insertcatagory(catagorymodel value) async {
    final catagory_database =
        await Hive.openBox<catagorymodel>(CATAGORY_DB_NAME);
    catagory_database.put(value.id,value);
    refreshUI();
  }

  @override
  Future<List<catagorymodel>> getcatogory() async {
    final catagory_database =
        await Hive.openBox<catagorymodel>(CATAGORY_DB_NAME);
    return catagory_database.values.toList();
  }

  Future<void> refreshUI() async {
    final AllCategories = await getcatogory();
    incomecategory.value.clear();
    expensecategory.value.clear();
    Future.forEach(AllCategories, (catagorymodel category) {
      if (category.type == catagorytype.income) {
        incomecategory.value.add(category);
      } else {
        expensecategory.value.add(category);
      }
    });
    incomecategory.notifyListeners();
    expensecategory.notifyListeners();
  }

  @override
  Future<void> deletecategory(String id) async {
    final catagorydb = await Hive.openBox<catagorymodel>(CATAGORY_DB_NAME);
    await catagorydb.delete(id);
    refreshUI();
  }


}
