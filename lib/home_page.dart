import 'package:flutter/material.dart';

import 'package:fcharts/fcharts.dart';
import 'dart:convert';

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

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "hello world",
        style: TextStyle(fontSize: 16.0, color: Colors.black45),
      ),
    );

    // set x-axis here so that both lines can use it
    final xAxis = new ChartAxis<String>();

    AspectRatio x =  new AspectRatio(
      aspectRatio: 4 / 3,
      child: new LineChart(
        chartPadding: new EdgeInsets.fromLTRB(60.0, 20.0, 30.0, 30.0),
        lines: [
          // size line
          new Line<DateStat, String, double>(
            data: stats,
            xFn: (stat) => stat.date,
            yFn: (stat) => stat.amount,
            xAxis: xAxis,
            yAxis: new ChartAxis(
              span: new DoubleSpan(0.0, 50000.0),
              opposite: true,
              tickGenerator: IntervalTickGenerator.byN(1),
              paint: const PaintOptions.stroke(color: Colors.green),
            ),
            marker: const MarkerOptions(
              paint: const PaintOptions.fill(color: Colors.green),
              shape: MarkerShapes.square,
            ),
            stroke: const PaintOptions.stroke(color: Colors.green),
            legend: new LegendItem(
              paint: const PaintOptions.fill(color: Colors.green),
              text: 'Size',
            ),
          ),
        ],
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[x],
      ),
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