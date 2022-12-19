import 'package:devstravel/src/models/appdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../partials/customAppbar.dart';
import '../partials/customDrawer.dart';
import 'package:devstravel/src/partials/cityBox.dart';

class FavoritesPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List favorities = appdata.favoritesCities();

      return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppbar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Cidades salvas',
          hideSearch: false,
        ),
        drawer: CustomDrawer(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              favorities.length,
              (index) {
                return CityBox(
                  data: favorities[index],
                  onTap: (cityData) {
                    Navigator.pushNamed(context, '/city', arguments: cityData);
                  },
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
