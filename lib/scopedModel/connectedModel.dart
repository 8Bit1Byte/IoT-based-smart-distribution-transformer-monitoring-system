import 'package:flutter/material.dart';
import 'package:smart_monitoring_system/model/appliance.dart';
import 'package:scoped_model/scoped_model.dart';

class ConnectedModel extends Model {
  final List<Appliance> _applianceList = [
    Appliance(
        title: 'AC',
        subtitle: '24 C',
        leftIcon: Icons.ac_unit,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),
    Appliance(
        title: 'Music',
        subtitle: 'Turned off',
        leftIcon: Icons.queue_music,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: false),
    Appliance(
        title: 'Router',
        subtitle: 'Sweet Home',
        leftIcon: Icons.router,
        topRightIcon: Icons.router,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),
    Appliance(
        title: 'Light',
        subtitle: '70 % brightness',
        leftIcon: Icons.lightbulb_outline,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),
    Appliance(
        title: 'Fans',
        subtitle: '70% Regulater',
        leftIcon: Icons.threesixty,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),
  ];
}

class ApplianceModel extends ConnectedModel {
  List<Appliance> get allYatch {
    return List.from(_applianceList);
  }
}
