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
      final date = element['date'];
      final double usdPaymentAmount = element['currencies']['USD']['paymentAmount'];

      return new DateStat(date, usdPaymentAmount);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {

    List<DateStat> stats = parseResponse(billingsJson);

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
      backgroundColor: Colors.white,
      body: body,
    );
  }
}

String billingsJson = """
[ {
  "date" : "2009-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2009-10-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2009-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2009-11-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2009-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2009-12-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-01-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-02-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-03-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-04-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-05-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-06-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-07-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-08-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-09-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-10-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-11-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2010-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2010-12-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-01-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-02-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-03-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-04-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-05-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-06-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-07-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-08-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-09-01",
      "currency" : "USD",
      "paymentTransactions" : 0,
      "paymentAmount" : 0.00,
      "paymentAmountPrimary" : 0.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 0,
      "renewingAmount" : 0.00,
      "renewingAmountPrimary" : 0.00,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-10-01",
      "currency" : "USD",
      "paymentTransactions" : 18,
      "paymentAmount" : 1185.30,
      "paymentAmountPrimary" : 1185.30,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 181,
      "renewingAmount" : 14694.72,
      "renewingAmountPrimary" : 14694.72,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2011-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-11-01",
      "currency" : "USD",
      "paymentTransactions" : 69,
      "paymentAmount" : 4574.80,
      "paymentAmountPrimary" : 4574.80,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 495,
      "renewingAmount" : 48741.91,
      "renewingAmountPrimary" : 48741.91,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 139.09,
      "renewingRefundAmountPrimary" : 139.09
    }
  }
}, {
  "date" : "2011-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2011-12-01",
      "currency" : "USD",
      "paymentTransactions" : 49,
      "paymentAmount" : 3313.00,
      "paymentAmountPrimary" : 3313.00,
      "refundTransactions" : 7,
      "refundAmount" : 365.00,
      "refundAmountPrimary" : 365.00,
      "renewingTransactions" : 678,
      "renewingAmount" : 77911.62,
      "renewingAmountPrimary" : 77911.62,
      "renewingRefundTransactions" : 28,
      "renewingRefundAmount" : 2108.02,
      "renewingRefundAmountPrimary" : 2108.02
    }
  }
}, {
  "date" : "2012-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-01-01",
      "currency" : "USD",
      "paymentTransactions" : 61,
      "paymentAmount" : 4970.00,
      "paymentAmountPrimary" : 4970.00,
      "refundTransactions" : 3,
      "refundAmount" : 207.00,
      "refundAmountPrimary" : 207.00,
      "renewingTransactions" : 647,
      "renewingAmount" : 82671.16,
      "renewingAmountPrimary" : 82671.16,
      "renewingRefundTransactions" : 1,
      "renewingRefundAmount" : 69.00,
      "renewingRefundAmountPrimary" : 69.00
    }
  }
}, {
  "date" : "2012-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-02-01",
      "currency" : "USD",
      "paymentTransactions" : 79,
      "paymentAmount" : 5451.00,
      "paymentAmountPrimary" : 5451.00,
      "refundTransactions" : 3,
      "refundAmount" : 207.00,
      "refundAmountPrimary" : 207.00,
      "renewingTransactions" : 639,
      "renewingAmount" : 80836.84,
      "renewingAmountPrimary" : 80836.84,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 815.31,
      "renewingRefundAmountPrimary" : 815.31
    }
  }
}, {
  "date" : "2012-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-03-01",
      "currency" : "USD",
      "paymentTransactions" : 62,
      "paymentAmount" : 4407.19,
      "paymentAmountPrimary" : 4407.19,
      "refundTransactions" : 3,
      "refundAmount" : 207.00,
      "refundAmountPrimary" : 207.00,
      "renewingTransactions" : 766,
      "renewingAmount" : 102595.52,
      "renewingAmountPrimary" : 102595.52,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 417.00,
      "renewingRefundAmountPrimary" : 417.00
    }
  }
}, {
  "date" : "2012-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-04-01",
      "currency" : "USD",
      "paymentTransactions" : 74,
      "paymentAmount" : 5029.77,
      "paymentAmountPrimary" : 5029.77,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 748,
      "renewingAmount" : 115947.99,
      "renewingAmountPrimary" : 115947.99,
      "renewingRefundTransactions" : 1,
      "renewingRefundAmount" : 149.00,
      "renewingRefundAmountPrimary" : 149.00
    }
  }
}, {
  "date" : "2012-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-05-01",
      "currency" : "USD",
      "paymentTransactions" : 85,
      "paymentAmount" : 5865.00,
      "paymentAmountPrimary" : 5865.00,
      "refundTransactions" : 3,
      "refundAmount" : 207.00,
      "refundAmountPrimary" : 207.00,
      "renewingTransactions" : 849,
      "renewingAmount" : 127224.50,
      "renewingAmountPrimary" : 127224.50,
      "renewingRefundTransactions" : 8,
      "renewingRefundAmount" : 1000.96,
      "renewingRefundAmountPrimary" : 1000.96
    }
  }
}, {
  "date" : "2012-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-06-01",
      "currency" : "USD",
      "paymentTransactions" : 65,
      "paymentAmount" : 4478.17,
      "paymentAmountPrimary" : 4478.17,
      "refundTransactions" : 6,
      "refundAmount" : 414.00,
      "refundAmountPrimary" : 414.00,
      "renewingTransactions" : 841,
      "renewingAmount" : 143598.83,
      "renewingAmountPrimary" : 143598.83,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 559.70,
      "renewingRefundAmountPrimary" : 559.70
    }
  }
}, {
  "date" : "2012-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-07-01",
      "currency" : "USD",
      "paymentTransactions" : 71,
      "paymentAmount" : 4762.21,
      "paymentAmountPrimary" : 4762.21,
      "refundTransactions" : 2,
      "refundAmount" : 138.00,
      "refundAmountPrimary" : 138.00,
      "renewingTransactions" : 987,
      "renewingAmount" : 158437.95,
      "renewingAmountPrimary" : 158437.95,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2012-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-08-01",
      "currency" : "USD",
      "paymentTransactions" : 80,
      "paymentAmount" : 5128.18,
      "paymentAmountPrimary" : 5128.18,
      "refundTransactions" : 2,
      "refundAmount" : 138.00,
      "refundAmountPrimary" : 138.00,
      "renewingTransactions" : 977,
      "renewingAmount" : 169411.15,
      "renewingAmountPrimary" : 169411.15,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 462.94,
      "renewingRefundAmountPrimary" : 462.94
    }
  }
}, {
  "date" : "2012-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-09-01",
      "currency" : "USD",
      "paymentTransactions" : 74,
      "paymentAmount" : 4711.14,
      "paymentAmountPrimary" : 4711.14,
      "refundTransactions" : 2,
      "refundAmount" : 138.00,
      "refundAmountPrimary" : 138.00,
      "renewingTransactions" : 117,
      "renewingAmount" : 16723.86,
      "renewingAmountPrimary" : 16723.86,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 97.63,
      "renewingRefundAmountPrimary" : 97.63
    }
  }
}, {
  "date" : "2012-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-10-01",
      "currency" : "USD",
      "paymentTransactions" : 88,
      "paymentAmount" : 5947.66,
      "paymentAmountPrimary" : 5947.66,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 210,
      "renewingAmount" : 19511.32,
      "renewingAmountPrimary" : 19511.32,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 528.81,
      "renewingRefundAmountPrimary" : 528.81
    }
  }
}, {
  "date" : "2012-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-11-01",
      "currency" : "USD",
      "paymentTransactions" : 59,
      "paymentAmount" : 3869.94,
      "paymentAmountPrimary" : 3869.94,
      "refundTransactions" : 3,
      "refundAmount" : 207.00,
      "refundAmountPrimary" : 207.00,
      "renewingTransactions" : 209,
      "renewingAmount" : 26869.41,
      "renewingAmountPrimary" : 26869.41,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2012-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2012-12-01",
      "currency" : "USD",
      "paymentTransactions" : 80,
      "paymentAmount" : 10650.00,
      "paymentAmountPrimary" : 10650.00,
      "refundTransactions" : 2,
      "refundAmount" : 138.00,
      "refundAmountPrimary" : 138.00,
      "renewingTransactions" : 1064,
      "renewingAmount" : 228460.20,
      "renewingAmountPrimary" : 228460.20,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 674.00,
      "renewingRefundAmountPrimary" : 674.00
    }
  }
}, {
  "date" : "2013-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-01-01",
      "currency" : "USD",
      "paymentTransactions" : 60,
      "paymentAmount" : 4022.24,
      "paymentAmountPrimary" : 4022.24,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 1211,
      "renewingAmount" : 267851.81,
      "renewingAmountPrimary" : 267851.81,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 207.00,
      "renewingRefundAmountPrimary" : 207.00
    }
  }
}, {
  "date" : "2013-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-02-01",
      "currency" : "USD",
      "paymentTransactions" : 66,
      "paymentAmount" : 4554.00,
      "paymentAmountPrimary" : 4554.00,
      "refundTransactions" : 2,
      "refundAmount" : 138.00,
      "refundAmountPrimary" : 138.00,
      "renewingTransactions" : 1220,
      "renewingAmount" : 293795.81,
      "renewingAmountPrimary" : 293795.81,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 298.00,
      "renewingRefundAmountPrimary" : 298.00
    }
  }
}, {
  "date" : "2013-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-03-01",
      "currency" : "USD",
      "paymentTransactions" : 63,
      "paymentAmount" : 4278.79,
      "paymentAmountPrimary" : 4278.79,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 1262,
      "renewingAmount" : 314470.05,
      "renewingAmountPrimary" : 314470.05,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 411.98,
      "renewingRefundAmountPrimary" : 411.98
    }
  }
}, {
  "date" : "2013-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-04-01",
      "currency" : "USD",
      "paymentTransactions" : 54,
      "paymentAmount" : 8456.58,
      "paymentAmountPrimary" : 8456.58,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 1294,
      "renewingAmount" : 340080.28,
      "renewingAmountPrimary" : 340080.28,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 138.00,
      "renewingRefundAmountPrimary" : 138.00
    }
  }
}, {
  "date" : "2013-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-05-01",
      "currency" : "USD",
      "paymentTransactions" : 59,
      "paymentAmount" : 4004.30,
      "paymentAmountPrimary" : 4004.30,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 1318,
      "renewingAmount" : 345890.92,
      "renewingAmountPrimary" : 345890.92,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 820.72,
      "renewingRefundAmountPrimary" : 820.72
    }
  }
}, {
  "date" : "2013-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-06-01",
      "currency" : "USD",
      "paymentTransactions" : 68,
      "paymentAmount" : 4518.44,
      "paymentAmountPrimary" : 4518.44,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1340,
      "renewingAmount" : 355587.44,
      "renewingAmountPrimary" : 355587.44,
      "renewingRefundTransactions" : 1,
      "renewingRefundAmount" : 199.00,
      "renewingRefundAmountPrimary" : 199.00
    }
  }
}, {
  "date" : "2013-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-07-01",
      "currency" : "USD",
      "paymentTransactions" : 50,
      "paymentAmount" : 3312.19,
      "paymentAmountPrimary" : 3312.19,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 1403,
      "renewingAmount" : 362962.30,
      "renewingAmountPrimary" : 362962.30,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2013-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-08-01",
      "currency" : "USD",
      "paymentTransactions" : 75,
      "paymentAmount" : 4996.70,
      "paymentAmountPrimary" : 4996.70,
      "refundTransactions" : 1,
      "refundAmount" : 69.00,
      "refundAmountPrimary" : 69.00,
      "renewingTransactions" : 1413,
      "renewingAmount" : 392643.81,
      "renewingAmountPrimary" : 392643.81,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 433.77,
      "renewingRefundAmountPrimary" : 433.77
    }
  }
}, {
  "date" : "2013-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-09-01",
      "currency" : "USD",
      "paymentTransactions" : 58,
      "paymentAmount" : 5609.87,
      "paymentAmountPrimary" : 5609.87,
      "refundTransactions" : 2,
      "refundAmount" : 129.00,
      "refundAmountPrimary" : 129.00,
      "renewingTransactions" : 1433,
      "renewingAmount" : 400646.41,
      "renewingAmountPrimary" : 400646.41,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 3650.27,
      "renewingRefundAmountPrimary" : 3650.27
    }
  }
}, {
  "date" : "2013-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-10-01",
      "currency" : "USD",
      "paymentTransactions" : 72,
      "paymentAmount" : 6785.81,
      "paymentAmountPrimary" : 6785.81,
      "refundTransactions" : 1,
      "refundAmount" : 30.00,
      "refundAmountPrimary" : 30.00,
      "renewingTransactions" : 1492,
      "renewingAmount" : 474392.28,
      "renewingAmountPrimary" : 474392.28,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 257.00,
      "renewingRefundAmountPrimary" : 257.00
    }
  }
}, {
  "date" : "2013-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-11-01",
      "currency" : "USD",
      "paymentTransactions" : 37,
      "paymentAmount" : 4287.15,
      "paymentAmountPrimary" : 4287.15,
      "refundTransactions" : 1,
      "refundAmount" : 99.00,
      "refundAmountPrimary" : 99.00,
      "renewingTransactions" : 1437,
      "renewingAmount" : 452802.86,
      "renewingAmountPrimary" : 452802.86,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 461.00,
      "renewingRefundAmountPrimary" : 461.00
    }
  }
}, {
  "date" : "2013-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2013-12-01",
      "currency" : "USD",
      "paymentTransactions" : 42,
      "paymentAmount" : 5558.00,
      "paymentAmountPrimary" : 5558.00,
      "refundTransactions" : 2,
      "refundAmount" : 398.00,
      "refundAmountPrimary" : 398.00,
      "renewingTransactions" : 1447,
      "renewingAmount" : 489895.99,
      "renewingAmountPrimary" : 489895.99,
      "renewingRefundTransactions" : 1,
      "renewingRefundAmount" : 99.00,
      "renewingRefundAmountPrimary" : 99.00
    }
  }
}, {
  "date" : "2014-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-01-01",
      "currency" : "USD",
      "paymentTransactions" : 44,
      "paymentAmount" : 4499.12,
      "paymentAmountPrimary" : 4499.12,
      "refundTransactions" : 2,
      "refundAmount" : 398.00,
      "refundAmountPrimary" : 398.00,
      "renewingTransactions" : 1474,
      "renewingAmount" : 589090.90,
      "renewingAmountPrimary" : 589090.90,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 237.23,
      "renewingRefundAmountPrimary" : 237.23
    }
  }
}, {
  "date" : "2014-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-02-01",
      "currency" : "USD",
      "paymentTransactions" : 47,
      "paymentAmount" : 4853.00,
      "paymentAmountPrimary" : 4853.00,
      "refundTransactions" : 2,
      "refundAmount" : 198.00,
      "refundAmountPrimary" : 198.00,
      "renewingTransactions" : 1473,
      "renewingAmount" : 537164.44,
      "renewingAmountPrimary" : 537164.44,
      "renewingRefundTransactions" : 0,
      "renewingRefundAmount" : 0.00,
      "renewingRefundAmountPrimary" : 0.00
    }
  }
}, {
  "date" : "2014-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-03-01",
      "currency" : "USD",
      "paymentTransactions" : 65,
      "paymentAmount" : 9535.00,
      "paymentAmountPrimary" : 9535.00,
      "refundTransactions" : 9,
      "refundAmount" : 2091.00,
      "refundAmountPrimary" : 2091.00,
      "renewingTransactions" : 1476,
      "renewingAmount" : 546698.24,
      "renewingAmountPrimary" : 546698.24,
      "renewingRefundTransactions" : 9,
      "renewingRefundAmount" : 988.93,
      "renewingRefundAmountPrimary" : 988.93
    }
  }
}, {
  "date" : "2014-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-04-01",
      "currency" : "USD",
      "paymentTransactions" : 49,
      "paymentAmount" : 6051.00,
      "paymentAmountPrimary" : 6051.00,
      "refundTransactions" : 1,
      "refundAmount" : 99.00,
      "refundAmountPrimary" : 99.00,
      "renewingTransactions" : 1498,
      "renewingAmount" : 681758.95,
      "renewingAmountPrimary" : 681758.95,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 168.00,
      "renewingRefundAmountPrimary" : 168.00
    }
  }
}, {
  "date" : "2014-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-05-01",
      "currency" : "USD",
      "paymentTransactions" : 54,
      "paymentAmount" : 6146.00,
      "paymentAmountPrimary" : 6146.00,
      "refundTransactions" : 5,
      "refundAmount" : 996.00,
      "refundAmountPrimary" : 996.00,
      "renewingTransactions" : 1510,
      "renewingAmount" : 608637.88,
      "renewingAmountPrimary" : 608637.88,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 297.00,
      "renewingRefundAmountPrimary" : 297.00
    }
  }
}, {
  "date" : "2014-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-06-01",
      "currency" : "USD",
      "paymentTransactions" : 73,
      "paymentAmount" : 8779.48,
      "paymentAmountPrimary" : 8779.48,
      "refundTransactions" : 2,
      "refundAmount" : 198.00,
      "refundAmountPrimary" : 198.00,
      "renewingTransactions" : 1525,
      "renewingAmount" : 649406.55,
      "renewingAmountPrimary" : 649406.55,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 6624.24,
      "renewingRefundAmountPrimary" : 6624.24
    }
  }
}, {
  "date" : "2014-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-07-01",
      "currency" : "USD",
      "paymentTransactions" : 64,
      "paymentAmount" : 7350.22,
      "paymentAmountPrimary" : 7350.22,
      "refundTransactions" : 3,
      "refundAmount" : 299.48,
      "refundAmountPrimary" : 299.48,
      "renewingTransactions" : 1587,
      "renewingAmount" : 661849.75,
      "renewingAmountPrimary" : 661849.75,
      "renewingRefundTransactions" : 21,
      "renewingRefundAmount" : 28768.20,
      "renewingRefundAmountPrimary" : 28768.20
    }
  }
}, {
  "date" : "2014-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-08-01",
      "currency" : "USD",
      "paymentTransactions" : 59,
      "paymentAmount" : 8041.40,
      "paymentAmountPrimary" : 8041.40,
      "refundTransactions" : 1,
      "refundAmount" : 99.00,
      "refundAmountPrimary" : 99.00,
      "renewingTransactions" : 1570,
      "renewingAmount" : 699621.72,
      "renewingAmountPrimary" : 699621.72,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 1166.98,
      "renewingRefundAmountPrimary" : 1166.98
    }
  }
}, {
  "date" : "2014-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-09-01",
      "currency" : "USD",
      "paymentTransactions" : 39,
      "paymentAmount" : 5179.51,
      "paymentAmountPrimary" : 5179.51,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1572,
      "renewingAmount" : 741958.22,
      "renewingAmountPrimary" : 741958.22,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 970.25,
      "renewingRefundAmountPrimary" : 970.25
    }
  }
}, {
  "date" : "2014-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-10-01",
      "currency" : "USD",
      "paymentTransactions" : 63,
      "paymentAmount" : 8338.00,
      "paymentAmountPrimary" : 8338.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1562,
      "renewingAmount" : 770178.39,
      "renewingAmountPrimary" : 770178.39,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 5378.90,
      "renewingRefundAmountPrimary" : 5378.90
    }
  }
}, {
  "date" : "2014-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-11-01",
      "currency" : "USD",
      "paymentTransactions" : 52,
      "paymentAmount" : 5748.00,
      "paymentAmountPrimary" : 5748.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1599,
      "renewingAmount" : 777120.24,
      "renewingAmountPrimary" : 777120.24,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 198.00,
      "renewingRefundAmountPrimary" : 198.00
    }
  }
}, {
  "date" : "2014-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2014-12-01",
      "currency" : "USD",
      "paymentTransactions" : 50,
      "paymentAmount" : 11475.39,
      "paymentAmountPrimary" : 11475.39,
      "refundTransactions" : 3,
      "refundAmount" : 297.00,
      "refundAmountPrimary" : 297.00,
      "renewingTransactions" : 1622,
      "renewingAmount" : 863509.81,
      "renewingAmountPrimary" : 863509.81,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 8325.31,
      "renewingRefundAmountPrimary" : 8325.31
    }
  }
}, {
  "date" : "2015-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-01-01",
      "currency" : "USD",
      "paymentTransactions" : 64,
      "paymentAmount" : 10332.15,
      "paymentAmountPrimary" : 10332.15,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1638,
      "renewingAmount" : 962340.23,
      "renewingAmountPrimary" : 962340.23,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 367.00,
      "renewingRefundAmountPrimary" : 367.00
    }
  }
}, {
  "date" : "2015-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-02-01",
      "currency" : "USD",
      "paymentTransactions" : 49,
      "paymentAmount" : 8302.00,
      "paymentAmountPrimary" : 8302.00,
      "refundTransactions" : 2,
      "refundAmount" : 298.69,
      "refundAmountPrimary" : 298.69,
      "renewingTransactions" : 1659,
      "renewingAmount" : 911994.73,
      "renewingAmountPrimary" : 911994.73,
      "renewingRefundTransactions" : 7,
      "renewingRefundAmount" : 558.65,
      "renewingRefundAmountPrimary" : 558.65
    }
  }
}, {
  "date" : "2015-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-03-01",
      "currency" : "USD",
      "paymentTransactions" : 51,
      "paymentAmount" : 7748.10,
      "paymentAmountPrimary" : 7748.10,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1656,
      "renewingAmount" : 966202.28,
      "renewingAmountPrimary" : 966202.28,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 5899.41,
      "renewingRefundAmountPrimary" : 5899.41
    }
  }
}, {
  "date" : "2015-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-04-01",
      "currency" : "USD",
      "paymentTransactions" : 64,
      "paymentAmount" : 8390.31,
      "paymentAmountPrimary" : 8390.31,
      "refundTransactions" : 2,
      "refundAmount" : 93.42,
      "refundAmountPrimary" : 93.42,
      "renewingTransactions" : 1676,
      "renewingAmount" : 1100093.40,
      "renewingAmountPrimary" : 1100093.40,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 331.76,
      "renewingRefundAmountPrimary" : 331.76
    }
  }
}, {
  "date" : "2015-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-05-01",
      "currency" : "USD",
      "paymentTransactions" : 49,
      "paymentAmount" : 6151.00,
      "paymentAmountPrimary" : 6151.00,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1718,
      "renewingAmount" : 1053543.65,
      "renewingAmountPrimary" : 1053543.65,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 348.88,
      "renewingRefundAmountPrimary" : 348.88
    }
  }
}, {
  "date" : "2015-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-06-01",
      "currency" : "USD",
      "paymentTransactions" : 67,
      "paymentAmount" : 14054.93,
      "paymentAmountPrimary" : 14054.93,
      "refundTransactions" : 1,
      "refundAmount" : 99.00,
      "refundAmountPrimary" : 99.00,
      "renewingTransactions" : 1698,
      "renewingAmount" : 1020666.07,
      "renewingAmountPrimary" : 1020666.07,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 2334.59,
      "renewingRefundAmountPrimary" : 2334.59
    }
  }
}, {
  "date" : "2015-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-07-01",
      "currency" : "USD",
      "paymentTransactions" : 69,
      "paymentAmount" : 31143.88,
      "paymentAmountPrimary" : 31143.88,
      "refundTransactions" : 2,
      "refundAmount" : 198.00,
      "refundAmountPrimary" : 198.00,
      "renewingTransactions" : 1749,
      "renewingAmount" : 1209027.50,
      "renewingAmountPrimary" : 1209027.50,
      "renewingRefundTransactions" : 1,
      "renewingRefundAmount" : 99.00,
      "renewingRefundAmountPrimary" : 99.00
    }
  }
}, {
  "date" : "2015-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-08-01",
      "currency" : "USD",
      "paymentTransactions" : 58,
      "paymentAmount" : 11994.75,
      "paymentAmountPrimary" : 11994.75,
      "refundTransactions" : 4,
      "refundAmount" : 796.00,
      "refundAmountPrimary" : 796.00,
      "renewingTransactions" : 1766,
      "renewingAmount" : 1083289.08,
      "renewingAmountPrimary" : 1083289.08,
      "renewingRefundTransactions" : 1,
      "renewingRefundAmount" : 299.00,
      "renewingRefundAmountPrimary" : 299.00
    }
  }
}, {
  "date" : "2015-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-09-01",
      "currency" : "USD",
      "paymentTransactions" : 53,
      "paymentAmount" : 6530.76,
      "paymentAmountPrimary" : 6530.76,
      "refundTransactions" : 2,
      "refundAmount" : 204.19,
      "refundAmountPrimary" : 204.19,
      "renewingTransactions" : 1781,
      "renewingAmount" : 1329345.49,
      "renewingAmountPrimary" : 1329345.49,
      "renewingRefundTransactions" : 1,
      "renewingRefundAmount" : 99.00,
      "renewingRefundAmountPrimary" : 99.00
    }
  }
}, {
  "date" : "2015-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-10-01",
      "currency" : "USD",
      "paymentTransactions" : 55,
      "paymentAmount" : 8226.12,
      "paymentAmountPrimary" : 8226.12,
      "refundTransactions" : 3,
      "refundAmount" : 598.00,
      "refundAmountPrimary" : 598.00,
      "renewingTransactions" : 1782,
      "renewingAmount" : 1085778.41,
      "renewingAmountPrimary" : 1085778.41,
      "renewingRefundTransactions" : 8,
      "renewingRefundAmount" : 1552.19,
      "renewingRefundAmountPrimary" : 1552.19
    }
  }
}, {
  "date" : "2015-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-11-01",
      "currency" : "USD",
      "paymentTransactions" : 59,
      "paymentAmount" : 9650.42,
      "paymentAmountPrimary" : 9650.42,
      "refundTransactions" : 2,
      "refundAmount" : 333.00,
      "refundAmountPrimary" : 333.00,
      "renewingTransactions" : 1804,
      "renewingAmount" : 1230753.38,
      "renewingAmountPrimary" : 1230753.38,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 6458.94,
      "renewingRefundAmountPrimary" : 6458.94
    }
  }
}, {
  "date" : "2015-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2015-12-01",
      "currency" : "USD",
      "paymentTransactions" : 46,
      "paymentAmount" : 5084.42,
      "paymentAmountPrimary" : 5084.42,
      "refundTransactions" : 1,
      "refundAmount" : 299.00,
      "refundAmountPrimary" : 299.00,
      "renewingTransactions" : 1843,
      "renewingAmount" : 1344548.52,
      "renewingAmountPrimary" : 1344548.52,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 1135.31,
      "renewingRefundAmountPrimary" : 1135.31
    }
  }
}, {
  "date" : "2016-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-01-01",
      "currency" : "USD",
      "paymentTransactions" : 45,
      "paymentAmount" : 5842.40,
      "paymentAmountPrimary" : 5842.40,
      "refundTransactions" : 1,
      "refundAmount" : 299.00,
      "refundAmountPrimary" : 299.00,
      "renewingTransactions" : 1833,
      "renewingAmount" : 1330032.97,
      "renewingAmountPrimary" : 1330032.97,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 1108.92,
      "renewingRefundAmountPrimary" : 1108.92
    }
  }
}, {
  "date" : "2016-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-02-01",
      "currency" : "USD",
      "paymentTransactions" : 66,
      "paymentAmount" : 9940.22,
      "paymentAmountPrimary" : 9940.22,
      "refundTransactions" : 3,
      "refundAmount" : 298.00,
      "refundAmountPrimary" : 298.00,
      "renewingTransactions" : 1858,
      "renewingAmount" : 1417655.41,
      "renewingAmountPrimary" : 1417655.41,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 198.00,
      "renewingRefundAmountPrimary" : 198.00
    }
  }
}, {
  "date" : "2016-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-03-01",
      "currency" : "USD",
      "paymentTransactions" : 60,
      "paymentAmount" : 33766.86,
      "paymentAmountPrimary" : 33766.86,
      "refundTransactions" : 4,
      "refundAmount" : 396.00,
      "refundAmountPrimary" : 396.00,
      "renewingTransactions" : 1874,
      "renewingAmount" : 1602724.52,
      "renewingAmountPrimary" : 1602724.52,
      "renewingRefundTransactions" : 1,
      "renewingRefundAmount" : 99.00,
      "renewingRefundAmountPrimary" : 99.00
    }
  }
}, {
  "date" : "2016-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-04-01",
      "currency" : "USD",
      "paymentTransactions" : 46,
      "paymentAmount" : 5762.52,
      "paymentAmountPrimary" : 5762.52,
      "refundTransactions" : 3,
      "refundAmount" : 297.00,
      "refundAmountPrimary" : 297.00,
      "renewingTransactions" : 1879,
      "renewingAmount" : 1321267.55,
      "renewingAmountPrimary" : 1321267.55,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 840.46,
      "renewingRefundAmountPrimary" : 840.46
    }
  }
}, {
  "date" : "2016-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-05-01",
      "currency" : "USD",
      "paymentTransactions" : 51,
      "paymentAmount" : 29178.21,
      "paymentAmountPrimary" : 29178.21,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1883,
      "renewingAmount" : 1542268.48,
      "renewingAmountPrimary" : 1542268.48,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 958.87,
      "renewingRefundAmountPrimary" : 958.87
    }
  }
}, {
  "date" : "2016-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-06-01",
      "currency" : "USD",
      "paymentTransactions" : 48,
      "paymentAmount" : 24014.80,
      "paymentAmountPrimary" : 24014.80,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1899,
      "renewingAmount" : 1419865.47,
      "renewingAmountPrimary" : 1419865.47,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 3403.21,
      "renewingRefundAmountPrimary" : 3403.21
    }
  }
}, {
  "date" : "2016-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-07-01",
      "currency" : "USD",
      "paymentTransactions" : 52,
      "paymentAmount" : 45963.38,
      "paymentAmountPrimary" : 45963.38,
      "refundTransactions" : 2,
      "refundAmount" : 204.19,
      "refundAmountPrimary" : 204.19,
      "renewingTransactions" : 1904,
      "renewingAmount" : 1477200.58,
      "renewingAmountPrimary" : 1477200.58,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 6896.43,
      "renewingRefundAmountPrimary" : 6896.43
    }
  }
}, {
  "date" : "2016-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-08-01",
      "currency" : "USD",
      "paymentTransactions" : 76,
      "paymentAmount" : 71864.21,
      "paymentAmountPrimary" : 71864.21,
      "refundTransactions" : 4,
      "refundAmount" : 796.00,
      "refundAmountPrimary" : 796.00,
      "renewingTransactions" : 1901,
      "renewingAmount" : 1738035.71,
      "renewingAmountPrimary" : 1738035.71,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 1587.93,
      "renewingRefundAmountPrimary" : 1587.93
    }
  }
}, {
  "date" : "2016-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-09-01",
      "currency" : "USD",
      "paymentTransactions" : 72,
      "paymentAmount" : 31394.85,
      "paymentAmountPrimary" : 31394.85,
      "refundTransactions" : 2,
      "refundAmount" : 198.00,
      "refundAmountPrimary" : 198.00,
      "renewingTransactions" : 1925,
      "renewingAmount" : 1451936.33,
      "renewingAmountPrimary" : 1451936.33,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 1226.01,
      "renewingRefundAmountPrimary" : 1226.01
    }
  }
}, {
  "date" : "2016-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-10-01",
      "currency" : "USD",
      "paymentTransactions" : 51,
      "paymentAmount" : 80473.53,
      "paymentAmountPrimary" : 80473.53,
      "refundTransactions" : 3,
      "refundAmount" : 297.00,
      "refundAmountPrimary" : 297.00,
      "renewingTransactions" : 1927,
      "renewingAmount" : 1670652.20,
      "renewingAmountPrimary" : 1670652.20,
      "renewingRefundTransactions" : 7,
      "renewingRefundAmount" : 92357.05,
      "renewingRefundAmountPrimary" : 92357.05
    }
  }
}, {
  "date" : "2016-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-11-01",
      "currency" : "USD",
      "paymentTransactions" : 61,
      "paymentAmount" : 78662.44,
      "paymentAmountPrimary" : 78662.44,
      "refundTransactions" : 2,
      "refundAmount" : 198.00,
      "refundAmountPrimary" : 198.00,
      "renewingTransactions" : 1933,
      "renewingAmount" : 1364427.17,
      "renewingAmountPrimary" : 1364427.17,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 2597.60,
      "renewingRefundAmountPrimary" : 2597.60
    }
  }
}, {
  "date" : "2016-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2016-12-01",
      "currency" : "USD",
      "paymentTransactions" : 46,
      "paymentAmount" : 31695.31,
      "paymentAmountPrimary" : 31695.31,
      "refundTransactions" : 0,
      "refundAmount" : 0.00,
      "refundAmountPrimary" : 0.00,
      "renewingTransactions" : 1937,
      "renewingAmount" : 1417751.46,
      "renewingAmountPrimary" : 1417751.46,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 888.45,
      "renewingRefundAmountPrimary" : 888.45
    }
  }
}, {
  "date" : "2017-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-01-01",
      "currency" : "USD",
      "paymentTransactions" : 67,
      "paymentAmount" : 118521.64,
      "paymentAmountPrimary" : 118521.64,
      "refundTransactions" : 3,
      "refundAmount" : 65499.00,
      "refundAmountPrimary" : 65499.00,
      "renewingTransactions" : 1988,
      "renewingAmount" : 2138724.69,
      "renewingAmountPrimary" : 2138724.69,
      "renewingRefundTransactions" : 7,
      "renewingRefundAmount" : 3439.70,
      "renewingRefundAmountPrimary" : 3439.70
    }
  }
}, {
  "date" : "2017-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-02-01",
      "currency" : "USD",
      "paymentTransactions" : 52,
      "paymentAmount" : 12606.23,
      "paymentAmountPrimary" : 12606.23,
      "refundTransactions" : 2,
      "refundAmount" : 198.00,
      "refundAmountPrimary" : 198.00,
      "renewingTransactions" : 1973,
      "renewingAmount" : 2417695.24,
      "renewingAmountPrimary" : 2417695.24,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 282.20,
      "renewingRefundAmountPrimary" : 282.20
    }
  }
}, {
  "date" : "2017-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-03-01",
      "currency" : "USD",
      "paymentTransactions" : 75,
      "paymentAmount" : 42535.96,
      "paymentAmountPrimary" : 42535.96,
      "refundTransactions" : 2,
      "refundAmount" : 198.00,
      "refundAmountPrimary" : 198.00,
      "renewingTransactions" : 1987,
      "renewingAmount" : 1687829.73,
      "renewingAmountPrimary" : 1687829.73,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 1014.17,
      "renewingRefundAmountPrimary" : 1014.17
    }
  }
}, {
  "date" : "2017-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-04-01",
      "currency" : "USD",
      "paymentTransactions" : 50,
      "paymentAmount" : 20866.20,
      "paymentAmountPrimary" : 20866.20,
      "refundTransactions" : 1,
      "refundAmount" : 99.00,
      "refundAmountPrimary" : 99.00,
      "renewingTransactions" : 1967,
      "renewingAmount" : 2042623.69,
      "renewingAmountPrimary" : 2042623.69,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 5398.00,
      "renewingRefundAmountPrimary" : 5398.00
    }
  }
}, {
  "date" : "2017-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-05-01",
      "currency" : "USD",
      "paymentTransactions" : 67,
      "paymentAmount" : 46183.67,
      "paymentAmountPrimary" : 46183.67,
      "refundTransactions" : 1,
      "refundAmount" : 99.00,
      "refundAmountPrimary" : 99.00,
      "renewingTransactions" : 2002,
      "renewingAmount" : 2163471.03,
      "renewingAmountPrimary" : 2163471.03,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 303.93,
      "renewingRefundAmountPrimary" : 303.93
    }
  }
}, {
  "date" : "2017-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-06-01",
      "currency" : "USD",
      "paymentTransactions" : 71,
      "paymentAmount" : 133058.40,
      "paymentAmountPrimary" : 133058.40,
      "refundTransactions" : 1,
      "refundAmount" : 99.00,
      "refundAmountPrimary" : 99.00,
      "renewingTransactions" : 1992,
      "renewingAmount" : 1900459.80,
      "renewingAmountPrimary" : 1900459.80,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 1069.73,
      "renewingRefundAmountPrimary" : 1069.73
    }
  }
}, {
  "date" : "2017-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-07-01",
      "currency" : "USD",
      "paymentTransactions" : 71,
      "paymentAmount" : 36338.73,
      "paymentAmountPrimary" : 36338.73,
      "refundTransactions" : 1,
      "refundAmount" : 99.00,
      "refundAmountPrimary" : 99.00,
      "renewingTransactions" : 2051,
      "renewingAmount" : 1686044.69,
      "renewingAmountPrimary" : 1686044.69,
      "renewingRefundTransactions" : 2,
      "renewingRefundAmount" : 134.63,
      "renewingRefundAmountPrimary" : 134.63
    }
  }
}, {
  "date" : "2017-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-08-01",
      "currency" : "USD",
      "paymentTransactions" : 63,
      "paymentAmount" : 28789.13,
      "paymentAmountPrimary" : 28789.13,
      "refundTransactions" : 25,
      "refundAmount" : 2964.43,
      "refundAmountPrimary" : 2964.43,
      "renewingTransactions" : 2062,
      "renewingAmount" : 2477768.74,
      "renewingAmountPrimary" : 2477768.74,
      "renewingRefundTransactions" : 28,
      "renewingRefundAmount" : 5805.16,
      "renewingRefundAmountPrimary" : 5805.16
    }
  }
}, {
  "date" : "2017-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-09-01",
      "currency" : "USD",
      "paymentTransactions" : 73,
      "paymentAmount" : 11612.93,
      "paymentAmountPrimary" : 11612.93,
      "refundTransactions" : 5,
      "refundAmount" : 1135.20,
      "refundAmountPrimary" : 1135.20,
      "renewingTransactions" : 2027,
      "renewingAmount" : 2212021.45,
      "renewingAmountPrimary" : 2212021.45,
      "renewingRefundTransactions" : 9,
      "renewingRefundAmount" : 3082.86,
      "renewingRefundAmountPrimary" : 3082.86
    }
  }
}, {
  "date" : "2017-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-10-01",
      "currency" : "USD",
      "paymentTransactions" : 59,
      "paymentAmount" : 9409.98,
      "paymentAmountPrimary" : 9409.98,
      "refundTransactions" : 5,
      "refundAmount" : 701.74,
      "refundAmountPrimary" : 701.74,
      "renewingTransactions" : 2078,
      "renewingAmount" : 2032398.74,
      "renewingAmountPrimary" : 2032398.74,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 12211.05,
      "renewingRefundAmountPrimary" : 12211.05
    }
  }
}, {
  "date" : "2017-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-11-01",
      "currency" : "USD",
      "paymentTransactions" : 48,
      "paymentAmount" : 60498.38,
      "paymentAmountPrimary" : 60498.38,
      "refundTransactions" : 2,
      "refundAmount" : 198.00,
      "refundAmountPrimary" : 198.00,
      "renewingTransactions" : 2057,
      "renewingAmount" : 1803245.79,
      "renewingAmountPrimary" : 1803245.79,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 17227.99,
      "renewingRefundAmountPrimary" : 17227.99
    }
  }
}, {
  "date" : "2017-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2017-12-01",
      "currency" : "USD",
      "paymentTransactions" : 53,
      "paymentAmount" : 35731.80,
      "paymentAmountPrimary" : 35731.80,
      "refundTransactions" : 4,
      "refundAmount" : 3297.00,
      "refundAmountPrimary" : 3297.00,
      "renewingTransactions" : 2058,
      "renewingAmount" : 2178496.63,
      "renewingAmountPrimary" : 2178496.63,
      "renewingRefundTransactions" : 9,
      "renewingRefundAmount" : 9090.33,
      "renewingRefundAmountPrimary" : 9090.33
    }
  }
}, {
  "date" : "2018-01-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-01-01",
      "currency" : "USD",
      "paymentTransactions" : 56,
      "paymentAmount" : 23521.28,
      "paymentAmountPrimary" : 23521.28,
      "refundTransactions" : 2,
      "refundAmount" : 200.00,
      "refundAmountPrimary" : 200.00,
      "renewingTransactions" : 2086,
      "renewingAmount" : 3173097.60,
      "renewingAmountPrimary" : 3173097.60,
      "renewingRefundTransactions" : 10,
      "renewingRefundAmount" : 35583.33,
      "renewingRefundAmountPrimary" : 35583.33
    }
  }
}, {
  "date" : "2018-02-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-02-01",
      "currency" : "USD",
      "paymentTransactions" : 52,
      "paymentAmount" : 19843.65,
      "paymentAmountPrimary" : 19843.65,
      "refundTransactions" : 3,
      "refundAmount" : 497.00,
      "refundAmountPrimary" : 497.00,
      "renewingTransactions" : 2100,
      "renewingAmount" : 3146077.57,
      "renewingAmountPrimary" : 3146077.57,
      "renewingRefundTransactions" : 7,
      "renewingRefundAmount" : 1540.53,
      "renewingRefundAmountPrimary" : 1540.53
    }
  }
}, {
  "date" : "2018-03-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-03-01",
      "currency" : "USD",
      "paymentTransactions" : 67,
      "paymentAmount" : 10716.10,
      "paymentAmountPrimary" : 10716.10,
      "refundTransactions" : 3,
      "refundAmount" : 481.78,
      "refundAmountPrimary" : 481.78,
      "renewingTransactions" : 2117,
      "renewingAmount" : 2638272.86,
      "renewingAmountPrimary" : 2638272.86,
      "renewingRefundTransactions" : 6,
      "renewingRefundAmount" : 10577.38,
      "renewingRefundAmountPrimary" : 10577.38
    }
  }
}, {
  "date" : "2018-04-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-04-01",
      "currency" : "USD",
      "paymentTransactions" : 54,
      "paymentAmount" : 44364.89,
      "paymentAmountPrimary" : 44364.89,
      "refundTransactions" : 2,
      "refundAmount" : 210.87,
      "refundAmountPrimary" : 210.87,
      "renewingTransactions" : 2127,
      "renewingAmount" : 3138155.16,
      "renewingAmountPrimary" : 3138155.16,
      "renewingRefundTransactions" : 11,
      "renewingRefundAmount" : 3468.08,
      "renewingRefundAmountPrimary" : 3468.08
    }
  }
}, {
  "date" : "2018-05-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-05-01",
      "currency" : "USD",
      "paymentTransactions" : 44,
      "paymentAmount" : 128752.09,
      "paymentAmountPrimary" : 128752.09,
      "refundTransactions" : 5,
      "refundAmount" : 1495.00,
      "refundAmountPrimary" : 1495.00,
      "renewingTransactions" : 2127,
      "renewingAmount" : 2596064.62,
      "renewingAmountPrimary" : 2596064.62,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 5590.33,
      "renewingRefundAmountPrimary" : 5590.33
    }
  }
}, {
  "date" : "2018-06-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-06-01",
      "currency" : "USD",
      "paymentTransactions" : 68,
      "paymentAmount" : 293943.50,
      "paymentAmountPrimary" : 293943.50,
      "refundTransactions" : 3,
      "refundAmount" : 447.05,
      "refundAmountPrimary" : 447.05,
      "renewingTransactions" : 2103,
      "renewingAmount" : 2544115.55,
      "renewingAmountPrimary" : 2544115.55,
      "renewingRefundTransactions" : 4,
      "renewingRefundAmount" : 20107.78,
      "renewingRefundAmountPrimary" : 20107.78
    }
  }
}, {
  "date" : "2018-07-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-07-01",
      "currency" : "USD",
      "paymentTransactions" : 65,
      "paymentAmount" : 35147.88,
      "paymentAmountPrimary" : 35147.88,
      "refundTransactions" : 6,
      "refundAmount" : 995.92,
      "refundAmountPrimary" : 995.92,
      "renewingTransactions" : 2128,
      "renewingAmount" : 2850776.99,
      "renewingAmountPrimary" : 2850776.99,
      "renewingRefundTransactions" : 10,
      "renewingRefundAmount" : 6400.60,
      "renewingRefundAmountPrimary" : 6400.60
    }
  }
}, {
  "date" : "2018-08-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-08-01",
      "currency" : "USD",
      "paymentTransactions" : 39,
      "paymentAmount" : 6867.21,
      "paymentAmountPrimary" : 6867.21,
      "refundTransactions" : 1,
      "refundAmount" : 299.00,
      "refundAmountPrimary" : 299.00,
      "renewingTransactions" : 2098,
      "renewingAmount" : 2800238.05,
      "renewingAmountPrimary" : 2800238.05,
      "renewingRefundTransactions" : 5,
      "renewingRefundAmount" : 1027.91,
      "renewingRefundAmountPrimary" : 1027.91
    }
  }
}, {
  "date" : "2018-09-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-09-01",
      "currency" : "USD",
      "paymentTransactions" : 54,
      "paymentAmount" : 14047.74,
      "paymentAmountPrimary" : 14047.74,
      "refundTransactions" : 1,
      "refundAmount" : 108.91,
      "refundAmountPrimary" : 108.91,
      "renewingTransactions" : 2075,
      "renewingAmount" : 2855985.44,
      "renewingAmountPrimary" : 2855985.44,
      "renewingRefundTransactions" : 7,
      "renewingRefundAmount" : 911.45,
      "renewingRefundAmountPrimary" : 911.45
    }
  }
}, {
  "date" : "2018-10-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-10-01",
      "currency" : "USD",
      "paymentTransactions" : 45,
      "paymentAmount" : 197666.57,
      "paymentAmountPrimary" : 197666.57,
      "refundTransactions" : 2,
      "refundAmount" : 201.82,
      "refundAmountPrimary" : 201.82,
      "renewingTransactions" : 2117,
      "renewingAmount" : 2949532.68,
      "renewingAmountPrimary" : 2949532.68,
      "renewingRefundTransactions" : 15,
      "renewingRefundAmount" : 22125.94,
      "renewingRefundAmountPrimary" : 22125.94
    }
  }
}, {
  "date" : "2018-11-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-11-01",
      "currency" : "USD",
      "paymentTransactions" : 49,
      "paymentAmount" : 58673.18,
      "paymentAmountPrimary" : 58673.18,
      "refundTransactions" : 3,
      "refundAmount" : 307.20,
      "refundAmountPrimary" : 307.20,
      "renewingTransactions" : 2097,
      "renewingAmount" : 2793442.00,
      "renewingAmountPrimary" : 2793442.00,
      "renewingRefundTransactions" : 7,
      "renewingRefundAmount" : 6428.08,
      "renewingRefundAmountPrimary" : 6428.08
    }
  }
}, {
  "date" : "2018-12-01",
  "currencies" : {
    "USD" : {
      "date" : "2018-12-01",
      "currency" : "USD",
      "paymentTransactions" : 32,
      "paymentAmount" : 41653.33,
      "paymentAmountPrimary" : 41653.33,
      "refundTransactions" : 2,
      "refundAmount" : 210.87,
      "refundAmountPrimary" : 210.87,
      "renewingTransactions" : 2111,
      "renewingAmount" : 3346352.29,
      "renewingAmountPrimary" : 3346352.29,
      "renewingRefundTransactions" : 3,
      "renewingRefundAmount" : 12796.77,
      "renewingRefundAmountPrimary" : 12796.77
    }
  }
}, {
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