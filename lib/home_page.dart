import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recurly_analytics/redux.dart';
//import 'package:json_annotation/json_annotation.dart';
//import 'package:flutter_json/model/post_model.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  createState() => HomePageDataState();
}


class HomePageDataState extends State<HomePage> {
  List list = List();
  String json_decoded;
  String url = "https://jsonplaceholder.typicode.com/posts/1";
  String mrr_url = "https://unbounce.recurly.com/analytics/stats/mrr/total";
  String kpi_url = "https://unbounce.recurly.com/analytics/stats/mrr/kpis";
  var isLoading = false;

  _fetchData() async {
    print("here");
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get(url);
    if (response.statusCode == 200) {
      print("**********************");
      print(response.request);
      print(response.statusCode);
      print(response.body);
      print(json.decode(response.body));
      print("**********************");
      try {
//        list = json.decode(response.body) as List;
      } catch (e) {
//        list.add(json.decode(response.body));
      };

      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Map<String,String> getStatsMap() {
    var responseMap = {
      'kpis': "Absolutely",
      'graph_json': "Beautiful"
    };
    return responseMap;
  }


  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeViewModel>(
      converter: (store) {
        return HomeViewModel(
            state: store.state,
        );
      },
      builder: (BuildContext context, HomeViewModel vm) {
        final lorem = Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Some Graphs Here',
            style: TextStyle(fontSize: 16.0, color: Colors.black45),
          ),
        );
        final kpiButton = Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
//            onPressed: ({responseMap}) => getStatsMap(),
            onPressed: (){
              print("hey there!!!");
            },
            padding: EdgeInsets.all(12),
            color: Colors.teal,
            child: Text('KPIs', style: TextStyle(color: Colors.white)),
          ),
        );
        final body = Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: <Widget>[
              lorem,
            ],
          ),
        );
        return Scaffold(


          appBar: AppBar(
            title: Text("MRR Reports"),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: new Text("Get Data"),
              onPressed: () => _fetchData(),
            ),
          ),

          backgroundColor: Colors.white,
          body: isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: new Text(list[index]['title']),
//                  trailing: new Image.network(
////                    list[index]['thumbnailUrl'],
////                    fit: BoxFit.cover,
//                    height: 40.0,
//                    width: 40.0,
//                  ),
                );
              }),
        );

      },
    );


  }
}

class HomeViewModel {
  final AppState state;

  HomeViewModel({this.state});
}
