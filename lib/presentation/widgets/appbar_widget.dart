import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget(
  String title,
  double elevation,
  BuildContext context,
) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
    ),
    elevation: elevation,
    centerTitle: true,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
  );
}
