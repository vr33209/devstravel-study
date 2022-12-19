import 'package:flutter/material.dart';

Widget CustomDrawer({
  required GlobalKey<ScaffoldState> scaffoldKey,
  required BuildContext pageContext,
}) {
  void goToRouter(String router) {
    Navigator.pushNamed(pageContext, router);
  }

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DevsTravel',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue'),
              ),
              Text(
                'Versão 1.0',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Helvetica Neue'),
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () => goToRouter('/home'),
        ),
        ListTile(
          leading: const Icon(Icons.public),
          title: const Text('Escolher Continente'),
          onTap: () => goToRouter('/continent'),
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('Buscar Cidade'),
          onTap: () => goToRouter('/search'),
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Cidades salvas'),
          onTap: () => goToRouter('/favorites'),
        ),
      ],
    ),
  );
}
