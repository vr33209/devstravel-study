import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  CityBox({required this.data, required this.onTap});

  final data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: GestureDetector(
        onTap: onTap(),
        child: Stack(children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
