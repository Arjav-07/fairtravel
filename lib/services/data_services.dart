import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fair_travel/model/data_model.dart';

class DataServices {
  final String baseUrl = "https://api.jsonbin.io/v3/b";

  Future<List<DataModel>> getInfo() async {
    final apiUrl = '/687290ab6063391d31ac42dc';
    try {
      final res = await http.get(Uri.parse(baseUrl + apiUrl));
      if (res.statusCode == 200) {
        final Map<String, dynamic> jsonMap = json.decode(res.body);
        final List<dynamic> jsonList = jsonMap['record']; // 🔥 key fix
        return jsonList.map((e) => DataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
