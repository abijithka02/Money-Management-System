import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/db_funcitons/catagory_db.dart';
import 'package:money_management/screens/catagory.dart';

class expense_catagory_list extends StatelessWidget {
  const expense_catagory_list({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: catagorydb().incomecategory,
        builder: (context, value, child) {
          return ListView.separated(
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final cat = value[index];
                return Card(
                  child: ListTile(
                    title: Text(cat.name),
                    trailing: IconButton(
                        onPressed: () {
                          catagorydb.instance.deletecategory(cat.id);
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
