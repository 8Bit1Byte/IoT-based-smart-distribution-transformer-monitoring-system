import 'package:flutter/material.dart';
import 'package:smart_monitoring_system/routes/device_details.dart';
import 'package:smart_monitoring_system/routes/home_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String devicedetials = '/devicedetails';

  RouteGenerator._() {}
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //   case homePage:
      //     return MaterialPageRoute(
      //       builder: (_) => HomePageBody(),
      //     );
      //   case devicedetials:
      //     return MaterialPageRoute(
      //       builder: (_) => DeviceDetails(),
      //     );
      default:
        throw FormatException("Route not found");
    }
  }
}
