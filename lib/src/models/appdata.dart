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
