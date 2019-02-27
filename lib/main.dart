import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:recurly_analytics/login_page.dart';
import 'package:recurly_analytics/home_page.dart';
import 'package:recurly_analytics/redux.dart';
import 'package:recurly_analytics/api.dart';

void main() {
  final store = new Store<AppState>(stateReducer,
      initialState: AppState.initial(),
      middleware: [
        AppMiddleware(RecurlyApi()),
      ]);

  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };
  final GlobalKey<NavigatorState> navigatorKey;

  MyApp({this.store, this.navigatorKey}) : super();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Recurly Analytics',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
      home: new LoginPage(),
        routes: routes
      ),
    );}
}
