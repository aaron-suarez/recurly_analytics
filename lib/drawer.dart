import 'package:flutter/material.dart';
import 'package:recurly_analytics/redux.dart';

class RecurlyDrawer extends StatelessWidget {
  final dynamic vm;

  RecurlyDrawer({this.vm}) : super();

  @override
  Widget build (BuildContext ctxt) {
    return new Drawer(
      child: new ListView(
        children: <Widget> [
          new DrawerHeader(
            child: Align(
              child: new Text(
                "Recurly Analytics",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              )
            ),
            decoration: new BoxDecoration(
              color: Colors.purple
            )
          ),
          new ListTile(
            title: new Text("Billings"),
            onTap: () {
              this.vm.onTap(GetStatsAction());
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("MRR"),
            onTap: () {
              this.vm.onTap(GetMRRAction());
            },
          ),
        ]
      )
    );
  }
}
