import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  var favorites = [];

  bool hasFavorite(cityName) {
    return favorites.contains(cityName);
  }

  bool toggleOnHeart(cityName) {
    var hasFavorite = this.hasFavorite(cityName);
    if (hasFavorite) {
      favorites.remove(cityName);
      return false;
    } else {
      favorites.add(cityName);
      return true;
    }
  }

  List searchCity(textSearch) {
    List result = [];
    textSearch = textSearch.trim().toLowerCase();

    if (textSearch == '') {
      return result;
    }

    for (var continents in data) {
      for (var country in continents['countries']) {
        for (var city in country['cities']) {
          if (city['name'].toLowerCase().contains(textSearch)) {
            print('teste');
            result.add(city);
          }
        }
      }
    }

    return result;
  }

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    final response =
        await http.get(Uri.parse('https://api.b7web.com.br/flutter1wb'));

    if (response.statusCode == 200) {
      setData(jsonDecode(response.body));
      return true;
    }

    return false;
  }
}
