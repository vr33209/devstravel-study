import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppbar({
  required GlobalKey<ScaffoldState> scaffoldKey,
  required BuildContext pageContext,
  String title = '',
  bool hideSearch = false,
  bool showBack = false,
}) {
  void onPressed() {
    if (!showBack) {
      scaffoldKey.currentState?.openDrawer();
    } else {
      Navigator.pop(pageContext);
    }
  }

  void onPressedSearch() {
    Navigator.pushReplacementNamed(pageContext, '/search');
  }

  return AppBar(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    elevation: 0,
    centerTitle: false,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Helvetica Neue',
      ),
    ),
    leading: IconButton(
      onPressed: onPressed,
      icon: Icon(showBack ? Icons.arrow_back : Icons.menu,
          color: Colors.black, size: 30),
      color: Colors.black,
    ),
    actions: [
      !hideSearch
          ? IconButton(
              onPressed: onPressedSearch,
              icon: const Icon(Icons.search),
              color: Colors.black,
            )
          : Container()
    ],
  );
}
