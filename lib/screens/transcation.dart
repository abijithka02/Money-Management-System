import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/db_funcitons/transactiondb.dart';
import 'package:money_management/models/transaction_model.dart';

class transcation extends StatelessWidget {
  const transcation({super.key});

  @override
  Widget build(BuildContext context) {
    transationdbing.instance.refresh();
    return ValueListenableBuilder(
        valueListenable: transationdbing.instance.listtrans,
        builder: (BuildContext context, List<transation_model> value,Widget? child) {
          return ListView.separated(
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final non = value[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(radius: 50, child: Text('10\ndec')),
                    title: Text('RS${non.amount}'),
                    subtitle: Text(non.category.name),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: value.length);
        });
  }
}
