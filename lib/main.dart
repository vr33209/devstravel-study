import 'package:flutter/material.dart';
import 'src/models/appdata.dart';
import 'src/pages/home.dart';
import 'src/pages/login.dart';
import 'src/pages/search.dart';
import 'src/pages/preload.dart';
import 'src/pages/continent.dart';
import 'src/pages/listCity.dart';
import 'src/pages/favorites.dart';
import 'src/pages/city.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: ((context) => AppData()),
          )
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
        '/preload': (context) => const PreloadPage(),
        '/search': (context) => const SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/listCity': (context) => ListCityPage(),
        '/city': (context) => const CityPage(),
        '/favorites': (context) => FavoritesPage(),
      },
      initialRoute: '/login',
    );
  }
}
