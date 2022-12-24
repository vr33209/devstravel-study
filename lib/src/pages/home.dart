import 'package:devstravel/src/models/appdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../partials/customAppbar.dart';
import '../partials/customDrawer.dart';
import '../partials/customBottomBar.dart';

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppbar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Pagina home',
            hideSearch: false,
          ),
          drawer: CustomDrawer(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text('Bem vindo ao', style: styles),
                ),
                Image.asset(
                  'lib/assets/devstravel_logo.png',
                  width: 200,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Seu guia de viagem perfeito', style: styles),
                )
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            pageContext: context,
            selectedIndex: 0,
          )),
    );
  }
}
