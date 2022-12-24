import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/partials/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../partials/customAppbar.dart';
import 'package:devstravel/src/partials/cityBox.dart';
import '../partials/customBottomBar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  bool isFavorite = false;

  var list = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void cityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  void onChangedSearch(text, pageContext) async {
    var newList =
        await Provider.of<AppData>(pageContext, listen: false).searchCity(text);

    setState(() {
      list = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      var cities = [];
      final countries =
          appdata.data.length > 1 ? appdata.data[0]['countries'] : [];
      for (var country in countries) {
        cities.addAll(country['cities']);
      }
      return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppbar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Busque uma cidade',
            hideSearch: true,
          ),
          drawer: CustomDrawer(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
          ),
          bottomNavigationBar:
              CustomBottomNavigationBar(pageContext: context, selectedIndex: 2),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Digite o nome de uma cidade',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 32,
                      )),
                  onChanged: (text) {
                    onChangedSearch(text, context);
                  },
                ),
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(list.length, (index) {
                  return CityBox(
                    data: list[index],
                    onTap: (cityData) {
                      Navigator.pushNamed(context, '/city',
                          arguments: cityData);
                    },
                  );
                }),
              ))
            ],
          ));
    });
  }
}
