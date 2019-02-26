import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'dart:async';
import 'dart:convert';

class RecurlyApi {
  final String rootDomain;

  RecurlyApi({
    this.rootDomain = "recurly.com",
  });

  String loginUrl() {
    return "https://app.$rootDomain/login";
  }

  // untested
  Future<Map> getStats(String cookie, String urlBase) async {
    return http.get("$urlBase/analytics/stats/mrr/kpis", headers: { "cookie": cookie, "Content-Type": 'application/json'} )
        .then((response) {
          return json.decode(response.body);
    });
  }

  Future<Map> getToken(String email, String password) async {
      final String csrfToken = await getCsrfToken();
      final String url = loginUrl();

      return http.post(url, body: {'user[email]': email, 'user[password]': password, 'authenticity_token': csrfToken })
        .then((response) {
          print("got response from login page: ${response.body} with headers: ${response.headers}");

          if (response.headers['location'] == loginUrl()) {
            throw('Something went wrong');
          }

           var responseMap = {
             'subdomain': response.headers['location'],
             'cookie': response.headers['set-cookie']
           };

           return responseMap;
         });
  }

  Future<String> getCsrfToken() async {
    var url = loginUrl();

    return http.get(url)
        .then((response) {
          print("got response from csrf page: ${response.body}");
          return parse(response.body)
            .querySelector('input[name="authenticity_token"]')
            .attributes['value'];
        });
  }
}