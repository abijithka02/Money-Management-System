import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/db_funcitons/catagory_db.dart';

class income_catagory_list extends StatelessWidget {
  const income_catagory_list({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: catagorydb().expensecategory,
        builder: (context, value, child) {
          return ListView.separated(
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final exp = value[index];
                return Card(
                  child: ListTile(
                    title: Text(exp.name),
                    trailing: IconButton(
                        onPressed: () {
                          catagorydb.instance.deletecategory(exp.id);
                        },
                        icon: Icon(Icons.delete)),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: value.length);
        });
  }
}
