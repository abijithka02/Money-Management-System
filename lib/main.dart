import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/models/catogory.dart';
import 'package:money_management/models/transaction_model.dart';
import 'package:money_management/screens/homescreen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(catagorytypeAdapter().typeId)) {
    Hive.registerAdapter(catagorytypeAdapter());
  }
  if (!Hive.isAdapterRegistered(catagorymodelAdapter().typeId)) {
    Hive.registerAdapter(catagorymodelAdapter());
  }
    if (!Hive.isAdapterRegistered(transationmodelAdapter().typeId)) {
    Hive.registerAdapter(transationmodelAdapter());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: homescreen(),
    );
  }
}
