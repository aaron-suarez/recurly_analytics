import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Some Graphs Here',
        style: TextStyle(fontSize: 16.0, color: Colors.black45),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[lorem],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
    );
  }
}
