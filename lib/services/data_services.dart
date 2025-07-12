import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fair_travel/model/data_model.dart'; // Update this import path as needed

class DataServices {
  final String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    final apiUrl = '/getplaces';
    try {
      final http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

      if (res.statusCode == 200) {
        List<dynamic> jsonList = json.decode(res.body);
        return jsonList.map((e) => DataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data: ${res.statusCode}');
      }
    } catch (e) {
      print("Error fetching data: $e");
      rethrow; // Optional: rethrow to handle higher up
    }
  }
}
