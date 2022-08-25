import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_monitoring_system/scopedModel/connectedModel.dart';

class DeviceDetails extends StatefulWidget {
  DeviceDetails(this.model, this.index, {Key? key}) : super(key: key);
  final ApplianceModel model;
  final int index;

  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Color(0xffe7eaf2),
        color: Color(0xff457be4),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(40.0, 40, 40, 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.allYatch[widget.index].title,
                        style: TextStyle(
                            fontSize: 43,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        widget.model.allYatch[widget.index].subtitle,
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        widget.model.allYatch[widget.index].leftIcon,
                        color: Colors.white,
                        size: 40,
                      ),
                      Switch(
                          value: widget.model.allYatch[widget.index].isEnable,
                          activeColor: Color(0xffffffff),
                          onChanged: (_) {
                            setState(() {
                              widget.model.allYatch[widget.index].isEnable =
                                  !widget.model.allYatch[widget.index].isEnable;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
