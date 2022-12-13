import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/db_funcitons/catagory_db.dart';
import 'package:money_management/db_funcitons/transactiondb.dart';
import 'package:money_management/dialog.dart';
import 'package:money_management/models/catogory.dart';
import 'package:money_management/models/transaction_model.dart';

class addtransaction extends StatefulWidget {
  addtransaction({super.key});

  @override
  State<addtransaction> createState() => _addtransactionState();
}

class _addtransactionState extends State<addtransaction> {
  final purpose = TextEditingController();

  final amont = TextEditingController();

  DateTime? selectedateorg;
  catagorytype? typeing;
  var dropselecteditem = null;
  catagorymodel? categorymodell;

  @override
  void initState() {
    typeing = catagorytype.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: purpose,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Purpose'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: amont,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Amount'),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton.icon(
                onPressed: () async {
                  final selecteddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 30)),
                      lastDate: DateTime.now());

                  if (selecteddate == null) {
                    return;
                  } else {
                    print(selecteddate.toString());
                    setState(() {
                      selectedateorg = selecteddate;
                    });
                  }
                },
                icon: Icon(Icons.calendar_today_rounded),
                label: Text(selectedateorg == null
                    ? 'Add Date'
                    : selectedateorg!.toString())),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                        value: typeing,
                        groupValue: catagorytype.income,
                        onChanged: (value) {
                          setState(() {
                            typeing = catagorytype.income;
                            dropselecteditem = null;
                          });
                        }),
                    Text('Income'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: typeing,
                        groupValue: catagorytype.expense,
                        onChanged: (value) {
                          setState(() {
                            typeing = catagorytype.expense;
                            dropselecteditem = null;
                          });
                        }),
                    Text('Expense'),
                  ],
                ),
              ],
            ),
            DropdownButton(
                hint: Text('Select Category'),
                value: dropselecteditem,
                items: (typeing == catagorytype.income
                        ? catagorydb.instance.incomecategory.value
                        : catagorydb.instance.expensecategory.value)
                    .map((e) {
                  return DropdownMenuItem(
                    child: Text(e.name),
                    value: e.id,
                    onTap: () {
                      categorymodell = e;
                    },
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropselecteditem = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  addtramsaction();
                },
                child: Text('Submit'))
          ],
        ),
      ),
    ));
  }

  Future<void> addtramsaction() async {
    final purpose_text = purpose.text;
    final amount_text = amont.text;
    if (purpose_text.isEmpty) {
      return;
    }
    if (amount_text.isEmpty) {
      return;
    }
    if (dropselecteditem == null) {
      return;
    }
    if (selectedateorg == null) {
      return;
    }
    final parsed_amount = double.tryParse(amount_text);
    if (parsed_amount == null) {
      return;
    }
    if (dropselecteditem == null) {
      return null;
    }
    final transationmodel = transation_model(
        purpose: purpose_text,
        amount: parsed_amount,
        date: selectedateorg!,
        type: typeing!,
        category: categorymodell!);
    transationdbing.instance.aadtraction(transationmodel);
  }
}
