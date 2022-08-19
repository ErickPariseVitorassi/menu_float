import 'package:flutter/material.dart';

class MenuFloatOption<T> {
  final String label;
  final T value;

  MenuFloatOption(this.label, this.value);
}

class MenuFloatItem<T> extends StatelessWidget {
  final T item;
  final String label;

  const MenuFloatItem({Key? key, required this.item, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('CLICK!!!');
        },
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              // decoration: BoxDecoration(
              //     color: Colors.white, border: Border.all(color: Colors.red)),
              child: Text(label,
                  style: const TextStyle(color: Colors.black, fontSize: 12)),
            )));
  }
}
