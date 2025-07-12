import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fair_travel/model/data_model.dart';

class DataServices {
  final String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    final apiUrl = '/getplaces';
    try {
      final res = await http.get(Uri.parse(baseUrl + apiUrl));
      if (res.statusCode == 200) {
        List<dynamic> jsonList = json.decode(res.body);
        return jsonList.map((e) => DataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
