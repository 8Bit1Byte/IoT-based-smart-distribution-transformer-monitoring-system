import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_monitoring_system/routes/device_details.dart';
import 'package:smart_monitoring_system/scopedModel/connectedModel.dart';
import 'package:intl/intl.dart';

class HomePageBody extends StatefulWidget {
  HomePageBody(this.model);

  final ApplianceModel model;

  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late DatabaseReference dbref;

  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance.ref();
  }

  _creatDB(model, index) {
    dbref
        .child(model.allYatch[index].title)
        .set({"State": !model.allYatch[index].isEnable});
  }

  Widget _upperContainer() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    DateFormat.yMMMMd('en_US')
                        .format(DateTime.now())
                        .toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Bharat Room',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(25)),
                child: Icon(
                  Icons.power,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '7.9',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'kwh',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Text(
                    'Power uses for today',
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildApplianceCard(ApplianceModel model, int index) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
          return DeviceDetails(model, index);
        })));
      }),
      child: Container(
        height: 220,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: index % 2 == 0
            ? EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5)
            : EdgeInsets.fromLTRB(7.5, 7.5, 15, 7.5),
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 3, offset: Offset(1, 3), color: Color(0xffa7a0a0))
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: model.allYatch[index].isEnable
                    ? [Color(0xff669df4), Color(0xff4e80f3)]
                    : [Colors.white, Colors.white]),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(model.allYatch[index].leftIcon,
                    color: model.allYatch[index].isEnable
                        ? Colors.white
                        : Color(0xffa3a3a3)),
                Switch(
                    value: model.allYatch[index].isEnable,
                    activeColor: Color(0xff457be4),
                    onChanged: (_) {
                      setState(() {
                        _creatDB(model, index);
                        model.allYatch[index].isEnable =
                            !model.allYatch[index].isEnable;
                      });
                    })
              ],
            ),
            SizedBox(
              height: 46,
            ),
            Text(
              model.allYatch[index].title,
              style: TextStyle(
                  color: model.allYatch[index].isEnable
                      ? Colors.white
                      : Color(0xff302e45),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              model.allYatch[index].subtitle,
              style: TextStyle(
                  color: model.allYatch[index].isEnable
                      ? Colors.white
                      : Color(0xffa3a3a3),
                  fontSize: 10),
            ),
            // Icon(model.allYatch[index].topRightIcon,color:model.allYatch[index].isEnable ? Colors.white : Color(0xffa3a3a3))
          ],
        ),
      ),
    );
  }

  Widget _applianceGrid(ApplianceModel model) {
    return Container(
        alignment: Alignment.topCenter,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        height: 487,
        child: GridView.count(
          // mainAxisSpacing: 10,
          // crossAxisSpacing: 10,
          crossAxisCount: 2,
          padding: EdgeInsets.all(0),
          children: List.generate(model.allYatch.length, (index) {
            return model.allYatch[index].title != null
                ? _buildApplianceCard(model, index)
                : Container(
                    height: 120,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                    margin: index % 2 == 0
                        ? EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5)
                        : EdgeInsets.fromLTRB(7.5, 7.5, 15, 7.5),
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0, 10),
                              color: Color(0xfff1f0f2))
                        ],
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Color(0xffa3a3a3)),
                        borderRadius: BorderRadius.circular(20)),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  );
          }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        // height: 258,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 50,
            bottom: 30,
            left: 30,
            right: 30.0),
        decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 3, offset: Offset(1, 3), color: Color(0xff9f9f9f))
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff669df4), Color(0xff4e80f3)]),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: _upperContainer(),
      ),
      _applianceGrid(widget.model)
    ]);
  }
}
