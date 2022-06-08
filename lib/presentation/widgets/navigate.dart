import 'package:flutter/material.dart';

void navigatorAndFinish(BuildContext context, String route) =>
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);

void navigateTo(BuildContext context, String route) => Navigator.pushNamed(
      context,
      route,
    );

void navigateWithArgument(
        BuildContext context, String route, dynamic argument) =>
    Navigator.pushNamed(context, route, arguments: argument);
