import 'package:flutter/cupertino.dart';

class Appliance {
  String? id;
  String title;
  String subtitle;
  IconData leftIcon;
  IconData topRightIcon;
  IconData bottomRightIcon;
  bool isEnable;
  Appliance(
      {required this.title,
      required this.subtitle,
      required this.leftIcon,
      required this.topRightIcon,
      required this.bottomRightIcon,
      required this.isEnable,
      this.id});
}
