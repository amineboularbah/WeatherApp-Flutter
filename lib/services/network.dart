import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.url);

  final String url;

  Future getData() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        String data = response.body;
        return json.decode(data);
      } else {
        print(response.statusCode);
      }
    } catch (ex) {
      print('getData()' + ex);
    }
  }
}
