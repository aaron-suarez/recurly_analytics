import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recurly_analytics/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:charts_flutter/flutter.dart' as charts;

enum Level {
  Very,
  Quite,
  Kinda,
  Not,
}

class DateStat {

  const DateStat(this.date, this.amount);

  final String date;
  final double amount;

  @override
  String toString() {
    return "DateStat(date: " + date + " amount: " + amount.toString() + ")";
  }
}

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  List<DateStat> parseResponse(String response) {

    final List<dynamic> jsonResponse = json.decode(response);

    return jsonResponse.map((element) {
      final date = element['date'];
      final double usdPaymentAmount = element['currencies']['USD']['paymentAmount'];

      return new DateStat(date, usdPaymentAmount);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeViewModel>(
      converter: (store) {
          return HomeViewModel(
            state: store.state
          );
      },
      builder: (BuildContext context, HomeViewModel vm) {

        if (vm.state.stats == null || vm.state.stats == "") {
          // loading screen
          return Scaffold(
            appBar: AppBar(
              title: Text('Billings (loading)'),
            ),
            backgroundColor: Colors.white,
            body: Align(
              child: new CircularProgressIndicator()
            )
          );

        }

        List<DateStat> stats = parseResponse(vm.state.stats);

        if (stats.length > 6) {
          stats = stats.sublist(stats.length - 6);
        }

        final seriesList = new charts.Series<DateStat, String>(
          id: 'Subscription MRR',
          colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
          domainFn: (DateStat stats, _) => stats.date.substring(0, 7),
          measureFn: (DateStat stats, _) => stats.amount,
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
            title: Text('Billings'),
          ),
          backgroundColor: Colors.white,
          body: body,
        );
      }
    );
  }
}

class HomeViewModel {
  final AppState state;

   HomeViewModel({this.state});
}
