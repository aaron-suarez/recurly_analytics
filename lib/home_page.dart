import 'package:flutter/material.dart';

import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'dart:math';

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
      print(element);
      final date = element['date'];
      final double usdPaymentAmount = element['currencies']['USD']['paymentAmount'];

      return new DateStat(date, usdPaymentAmount);

    }).toList();
  }

  @override
  Widget build(BuildContext context) {

    final stats = parseResponse(billingsJson);
    print("stats: " + stats.toString());

    // get the maximum value to scale the chart appropriately
    final statValMax = stats.map((stat) => stat.amount).toList().reduce(max);

    final tickInterval = statValMax / 10;

    final seriesList = new charts.Series<DateStat, String>(
      id: 'Subscription MRR',
      colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
      domainFn: (DateStat stats, _) => stats.date,
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
      backgroundColor: Colors.white,
      body: body,
    );
  }
}

String billingsJson = """
[
{
  "date" : "2019-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2019-01-01",
      "currency" : "USD",
      "paymentTransactions" : 55,
      "paymentAmount" : 36504.93,
      "paymentAmountPrimary" : 36504.93,
      "refundTransactions" : 1,
      "refundAmount" : 106.18,
      "refundAmountPrimary" : 106.18,
      "renewingTransactions" : 2115,
      "renewingAmount" : 2979953.33,
      "renewingAmountPrimary" : 2979953.33,
      "renewingRefundTransactions" : 7,
      "renewingRefundAmount" : 11470.91,
      "renewingRefundAmountPrimary" : 11470.91
    }
  }
}, {
  "date" : "2019-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2019-02-01",
      "currency" : "USD",
      "paymentTransactions" : 45,
      "paymentAmount" : 27384.66,
      "paymentAmountPrimary" : 27384.66,
      "refundTransactions" : 33,
      "refundAmount" : 8106.31,
      "refundAmountPrimary" : 8106.31,
      "renewingTransactions" : 2901,
      "renewingAmount" : 3614843.73,
      "renewingAmountPrimary" : 3614843.73,
      "renewingRefundTransactions" : 1192,
      "renewingRefundAmount" : 1023684.63,
      "renewingRefundAmountPrimary" : 1023684.63
    }
  }
} ]
""";