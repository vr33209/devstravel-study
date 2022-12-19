import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/partials/customDrawer.dart';
import 'package:devstravel/src/partials/cityBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../partials/customAppbar.dart';

class ContinentPage extends StatelessWidget {
  ContinentPage({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void seeCityAction(pageContext, continentIndex) {
    Navigator.pushNamed(pageContext, '/listCity', arguments: continentIndex);
  }

  void cityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppbar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Escolha um continente',
        ),
        drawer: CustomDrawer(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (context, index) {
            var cities = [];
            for (var country in appdata.data[index]['countries']) {
              cities.addAll(country['cities']);
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${appdata.data[index]['name']} (${cities.length})',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Helvetica Neue"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        seeCityAction(context, index);
                      },
                      child: const Text(
                        'Ver cidades',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Helvetica Neue"),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (cityContext, index) {
                      return CityBox(
                          data: cities[index],
                          onTap: (cityData) {
                            cityBoxAction(context, cityData);
                          });
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
