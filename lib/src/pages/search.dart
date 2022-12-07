import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/partials/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../partials/customAppbar.dart';

class SearchPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Text('Busque uma cidade')],
          ),
        ),
      ),
    );
  }
}
