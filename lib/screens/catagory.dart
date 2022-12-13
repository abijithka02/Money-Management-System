import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/db_funcitons/catagory_db.dart';
import 'package:money_management/screens/expense_catogory_list.dart';
import 'package:money_management/screens/income_catogory_list.dart';

class catagory extends StatefulWidget {
  const catagory({super.key});

  @override
  State<catagory> createState() => _catagoryState();
}

class _catagoryState extends State<catagory>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    catagorydb().refreshUI();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: tabcontroller,
            tabs: [
              Tab(
                text: 'Expense',
              ),
              Tab(
                text: 'Income',
              ),
            ]),
        Expanded(
          child: TabBarView(
              controller: tabcontroller,
              children: [income_catagory_list(), expense_catagory_list()]),
        )
      ],
    );
  }
}
