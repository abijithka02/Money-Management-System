import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/screens/homescreen.dart';

class bottombar extends StatelessWidget {
  bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: homescreen.newvalue,
      builder: (context, value, child) {
        return BottomNavigationBar(
            currentIndex: value,
            onTap: (value) {
              homescreen.newvalue.value = value;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.track_changes), label: 'Transaction'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories')
            ]);
      },
    );
  }
}
