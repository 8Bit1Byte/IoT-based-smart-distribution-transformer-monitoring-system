import 'package:flutter/material.dart';
import 'package:smart_monitoring_system/routes.dart';
import 'package:smart_monitoring_system/scopedModel/connectedModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'routes/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ApplianceModel model = ApplianceModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ApplianceModel>(
      model: model,
      child: MaterialApp(
        // initialRoute: RouteGenerator.homePage,
        // onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(model),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.model);

  final ApplianceModel model;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xfffcfcfd),
      child: HomePageBody(widget.model),
    ));
  }
}
