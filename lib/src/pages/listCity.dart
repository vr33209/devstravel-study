import 'package:devstravel/src/models/appdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../partials/customAppbar.dart';
import '../partials/cityBox.dart';
import '../partials/customDrawer.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void cityBoxAction(cityData) {}

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    int continentIndex = int.parse(args.toString());

    return Consumer<AppData>(builder: (ctx, appdata, child) {
      var cities = [];
      for (var country in appdata.data[continentIndex]['countries']) {
        cities.addAll(country['cities']);
      }
      return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppbar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title:
                "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
            hideSearch: false,
            showBack: true),
        drawer: CustomDrawer(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(
            cities.length,
            (index) {
              return CityBox(
                data: cities[index],
                onTap: (cityData) {
                  cityBoxAction(cityData);
                },
              );
            },
          ),
        ),
      );
    });
  }
}
