import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/bottomnavigation.dart';
import 'package:money_management/db_funcitons/catagory_db.dart';
import 'package:money_management/dialog.dart';
import 'package:money_management/models/catogory.dart';
import 'package:money_management/screens/add_transaction.dart';
import 'package:money_management/screens/catagory.dart';
import 'package:money_management/screens/transcation.dart';

class homescreen extends StatelessWidget {
  homescreen({super.key});

  final page = [transcation(), catagory()];

  static ValueNotifier<int> newvalue = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Management'),
        centerTitle: true,
      ),
      bottomNavigationBar: bottombar(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: newvalue,
        builder: (context, value, child) {
          return page[value];
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (newvalue.value == 0) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return addtransaction();
            }));
          } else {
            print('Add Catogory');
            showdialog(context);
            // final sample = catagorymodel(
            //     id: DateTime.now().millisecondsSinceEpoch.toString(),
            //     name: 'travel',
            //     type: catagorytype.expense);
            // catagorydb().insertcatagory(sample);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
