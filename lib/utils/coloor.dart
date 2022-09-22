import 'package:flutter/material.dart';

Color setD(int co) {
  if (co == 1) {
    return Colors.amber[100] as Color;
  }
  if (co == 2) {
    return Colors.green[100] as Color;
  }
  if (co == 3) {
    return Colors.lightBlue[100] as Color;
  }
  if (co == 4) {
    return Colors.orange[100] as Color;
  }
  if (co == 5) {
    return Colors.redAccent[100] as Color;
  }
  if (co == 0) {
    return Colors.white;
  }
  return Colors.white;
}
