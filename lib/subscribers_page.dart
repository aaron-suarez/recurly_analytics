import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recurly_analytics/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:recurly_analytics/drawer.dart';

class SubscribersStat {
  const SubscribersStat(this.date, this.count);

  final String date;
  final int count;

  @override
  String toString() {
    return "SubscribersStat(date: " + date + " amount: " + count.toString() + ")";
  }
}

class SubscribersPage extends StatelessWidget {
  static String tag = 'subscribers-page';

  List<SubscribersStat> parseResponse(String response) {

    final List<dynamic> jsonResponse = json.decode(response);

    return jsonResponse.map((element) {
      final date = element['date'];
      final int count = element['totalSubscribers'];

      return new SubscribersStat(date, count);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, SubscribersViewModel>(
      converter: (store) {
          return SubscribersViewModel(
            state: store.state,
            onTap: (action) => store.dispatch(action)
          );
      },
      builder: (BuildContext context, SubscribersViewModel vm) {

        if (vm.state.stats == null || vm.state.stats == "") {
          // loading screen
          return Scaffold(
            appBar: AppBar(
              title: Text('Subscribers (loading)'),
            ),
            backgroundColor: Colors.white,
            body: Align(
              child: new CircularProgressIndicator()
            )
          );

        }

        List<SubscribersStat> stats = parseResponse(vm.state.stats);

        if (stats.length > 6) {
          stats = stats.sublist(stats.length - 6);
        }

        final seriesList = new charts.Series<SubscribersStat, String>(
          id: 'Subscribers',
          colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
          domainFn: (SubscribersStat stats, _) => stats.date.substring(0, 7),
          measureFn: (SubscribersStat stats, _) => stats.count,
          data: stats,
        );

        final chart = new charts.BarChart(
          [ seriesList ],
          animate: true,
        );

        final body = Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 20.0, left: 10.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: chart
          )
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('Subscribers'),
          ),
          backgroundColor: Colors.white,
          body: body,
          drawer: new RecurlyDrawer(vm: vm),
        );
      }
    );
  }
}

class SubscribersViewModel {
  final AppState state;
  final void Function(dynamic action) onTap;

  SubscribersViewModel({this.state, this.onTap});
}
