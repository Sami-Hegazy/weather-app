import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/wheather_model.dart';

class WheatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '10a6e2458a37481eac3125146231005';

  Future<WeatherModel> getWheather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel wheatherModel = WeatherModel.fromJsom(data);

    return wheatherModel;
  }
}
