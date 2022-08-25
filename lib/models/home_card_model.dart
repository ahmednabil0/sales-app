import 'package:flutter/widgets.dart';

class HomeCardModel {
  String type;
  IconData icon;
  void Function() ontap;
  HomeCardModel({
    required this.type,
    required this.ontap,
    required this.icon,
  });
}
