// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class ColoredBox2 extends StatelessWidget {
  Color color;
  ColoredBox2({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      height: 30,
      width: 30,
      // child: Text("Hello"),
    );
  }
}
