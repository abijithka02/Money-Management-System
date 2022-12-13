import 'package:flutter/material.dart';
import 'package:money_management/db_funcitons/catagory_db.dart';
import 'package:money_management/models/catogory.dart';

ValueNotifier<catagorytype> valuenotifier = ValueNotifier(catagorytype.income);

Future<void> showdialog(BuildContext context) async {
  final nameeditingcontroller = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: Text('Add Catagory'),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  controller: nameeditingcontroller,
                  decoration: InputDecoration(
                      hintText: 'Catagory Name', border: OutlineInputBorder())),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [
                RadioButton(data: 'Income', type: catagorytype.income),
                RadioButton(data: 'Expense', type: catagorytype.expense)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    final name = nameeditingcontroller.text;
                    if (name.isEmpty) {
                      return;
                    }
                    final type = valuenotifier.value;
                    final category = catagorymodel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: name,
                        type: type);
                    catagorydb().insertcatagory(category);
                    Navigator.of(ctx).pop();
                  },
                  child: Text('Add')),
            )
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  final String data;
  final catagorytype type;

  const RadioButton({super.key, required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: valuenotifier,
          builder: (context, value, child) {
            return Radio<catagorytype>(
                value: type,
                groupValue: valuenotifier.value,
                onChanged: (value) {
                  if (value == null) {
                    return null;
                  }
                  valuenotifier.value = value;
                  valuenotifier.notifyListeners();
                });
          },
        ),
        Text(data),
      ],
    );
  }
}
